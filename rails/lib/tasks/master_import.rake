# frozen_string_literal: true

require 'csv'

namespace :master_import do
  desc '都道府県マスターのインポート'
  task :prefectures, ['path'] => :environment do |_task, args|
    puts 'Prefectures Master Importing...'
    before_count = Prefecture.count

    begin
      csv = Rails.root.join((args.path.presence || 'prefecture.csv'))
      ActiveRecord::Base.transaction do
        CSV.foreach(csv, headers: true) do |data|
          raise SyntaxError if data['id'].to_i.zero?

          Prefecture.create({
                              id: data['id'].to_i,
                              name: data['name']
                            })
        end
      end

      after_count = Prefecture.count
      puts "Prefecture: #{after_count - before_count}件 挿入しました"
    rescue ActiveRecord::RecordNotUnique
      Rails.logger.error '[ERROR]'
      Rails.logger.error 'IDが重複しています'
      Rails.logger.error 'イエウールと共通のIDのためTABLEを作り直して挿入してください'
    rescue TypeError
      Rails.logger.error '[ERROR]'
      Rails.logger.error '定義に一致するCSVファイルが見つかりません'
    rescue SyntaxError
      Rails.logger.error '[ERROR]'
      Rails.logger.error 'IDは整数を指定してください'
    rescue StandardError => e
      Rails.logger.error '挿入中に未知のエラーが発生しました'
      Rails.logger.error e
      Rails.logger.error e.class
    end
  end

  desc '市区町村マスターのインポート'
  task :cities, ['path'] => :environment do |_task, args|
    puts 'Cities Master Importing...'
    before_count = City.count

    begin
      csv = Rails.root.join((args.path.presence || 'city.csv'))
      ActiveRecord::Base.transaction do
        CSV.foreach(csv, headers: true) do |data|
          raise SyntaxError if data['id'].to_i.zero?

          City.create({
                        id: data['id'],
                        prefecture_id: data['prefecture_id'],
                        name: data['name'],
                        yomi: data['yomi']
                      })
        end
      end

      after_count = City.count
      puts "City: #{after_count - before_count}件 挿入しました"
      raise '挿入件数が0件です' if (after_count - before_count).zero?
    rescue ActiveRecord::RecordNotUnique
      Rails.logger.error '[ERROR]'
      Rails.logger.error 'IDが重複しています'
      Rails.logger.error 'イエウールと共通のIDのためTABLEを作り直して挿入してください'
    rescue TypeError
      Rails.logger.error '[ERROR]'
      Rails.logger.error '定義に一致するCSVファイルが見つかりません'
    rescue SyntaxError
      Rails.logger.error '[ERROR]'
      Rails.logger.error 'IDは整数を指定してください'
    rescue StandardError => e
      Rails.logger.error '挿入中に未知のエラーが発生しました'
      Rails.logger.error e
      Rails.logger.error e.class
    end
  end

  desc '企業マスターのインポート'
  task :companies, ['path'] => :environment do |_task, args|
    puts 'Companies/branches/Assessment_Areas Master Importing...'

    before_company_count = Company.count
    before_branch_count = Branch.count
    before_assessment_area_count = AssessmentArea.count

    begin
      csv = Rails.root.join((args.path.presence || 'company.csv'))

      ActiveRecord::Base.transaction do
        CSV.foreach(csv, headers: true) do |data|
          raise SyntaxError if data['company_id'].to_i.zero? || data['branch_id'].to_i.zero?

          # Company
          company = Company.find_or_create_by(id: data['company_id']) do |c|
            c.name = data['name']
          end

          # 住所取得
          prefecture = Prefecture.find_by(name: data['prefecture'])
          city = City.find_by(name: data['city'])

          # Branch
          branch = company.branches.create({
                                             name: data['branch_name'],
                                             logo_url: data['logo_url'],
                                             post_code: data['post_code'],
                                             prefecture_id: prefecture.id,
                                             city_id: city.id,
                                             address: data['address'],
                                             tel: data['tel'],
                                             fax: data['fax'],
                                             business_hours_text: data['business_hours_text'],
                                             holidays_text: data['holidays_text'],
                                             catchcopy: data['catchcopy'],
                                             introduction: data['introduction']
                                           })

          # Assessment_Area
          data['assessment_areas'].split(',').each do |assessment_area_city_id|
            branch.assessment_areas.create(
              city_id: assessment_area_city_id
            )
          end
        end
      end

      after_company_count = Company.count
      after_branch_count = Branch.count
      after_assessment_area_count = AssessmentArea.count

      puts "Company: #{after_company_count - before_company_count}件 挿入しました"
      puts "Branch: #{after_branch_count - before_branch_count}件 挿入しました"
      puts "AssessmentArea: #{after_assessment_area_count - before_assessment_area_count}件 挿入しました"
      raise '挿入件数が0件です' if (after_assessment_area_count - before_assessment_area_count).zero?
    rescue ActiveRecord::RecordNotUnique
      Rails.logger.error '[ERROR]'
      Rails.logger.error 'IDが重複しています'
      Rails.logger.error 'イエウールと共通のIDのためTABLEを作り直して挿入してください'
    rescue TypeError
      Rails.logger.error '[ERROR]'
      Rails.logger.error '定義に一致するCSVファイルが見つかりません'
    rescue SyntaxError
      Rails.logger.error '[ERROR]'
      Rails.logger.error 'IDは整数を指定してください'
    rescue StandardError => e
      Rails.logger.error '挿入中に未知のエラーが発生しました'
      Rails.logger.error e
      Rails.logger.error e.class
    end
  end

  desc '口コミマスターのインポート'
  task :reviews, ['path'] => :environment do |_task, args|
    puts 'Reviews Master Importing...'

    before_count = Review.count

    # enum mapping
    gender = { '男性' => 0, '女性' => 1, 'その他・不明' => 2 }
    building_type = { 'マンション' => 0, '戸建て' => 1, '土地' => 2 }
    times_type = { '初めて' => 0, '2回目' => 1, '3回以上' => 2 }

    begin
      csv = Rails.root.join((args.path.presence || 'review.csv'))

      ActiveRecord::Base.transaction do
        CSV.foreach(csv, headers: true) do |data|
          # 店舗取得
          branch = Branch.find(data['branch_id'])
          # 住所取得
          prefecture = Prefecture.find_by(name: data['prefecture'])
          city = City.find_by(name: data['city'])

          # Review
          calculated_sale_reason = if data['sale_reason_type'].to_i == 99
                                     data['sale_reason_type'].to_i
                                   else
                                     data['sale_reason_type'].to_i - 1
                                   end

          branch.reviews.create({
                                  prefecture_id: prefecture.id,
                                  city_id: city.id,
                                  name: data['name'],
                                  gender: gender[data['gender']],
                                  age: data['age'],
                                  address: data['address'],
                                  building_type: building_type[data['building_type']],
                                  times_type: times_type[data['times']],
                                  consider_season: data['consider_season'],
                                  assessment_season: data['assessment_season'],
                                  po_season: data['po_season'],
                                  sale_season: data['sale_season'],
                                  delivery_season: data['delivery_season'],
                                  speed_cs: data['speed_cs'],
                                  assessment_price: data['assessment_price'],
                                  sale_price: data['sale_price'],
                                  is_price_down: data['is_price_down'],
                                  price_down_month: data['price_down_month'],
                                  price_down_amount: data['price_down_amount'],
                                  close_price: data['close_price'],
                                  price_cs: data['price_cs'],
                                  contract_type: (data['contract_type'].to_i - 1),
                                  title: data['title'],
                                  sale_reason_type: calculated_sale_reason,
                                  anxiety: data['anxiety'],
                                  decision_reason: data['decision_reason'],
                                  support_cs: data['support_cs'],
                                  support_reason: data['support_reason'],
                                  advice: data['advice'],
                                  request: data['request']
                                })
        end
      end

      after_count = Review.count

      puts "Review: #{after_count - before_count}件 挿入しました"
      raise '挿入件数が0件です' if (after_count - before_count).zero?
    rescue ActiveRecord::RecordNotUnique
      Rails.logger.error '[ERROR]'
      Rails.logger.error 'IDが重複しています'
    rescue TypeError
      Rails.logger.error '[ERROR]'
      Rails.logger.error '定義に一致するCSVファイルが見つかりません'
    rescue StandardError => e
      Rails.logger.error '挿入中に未知のエラーが発生しました'
      Rails.logger.error e
      Rails.logger.error e.class
    end
  end
end
