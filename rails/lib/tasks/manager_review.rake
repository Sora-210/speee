require 'csv'

namespace :manager_review do
    desc 'コマンドヘルプの表示'
    task help: :environment do
        puts "######################"
        puts "[manager_review help]"
        puts "manager_review:add['fileName']        売却体験談の追加(重複の確認なし)"
        puts "manager_review:public['reviewId']     売却体験談の公開"
        puts "manager_review:private['reviewId']    売却体験談の非公開"
        puts "######################"
    end

    desc '売却体験談の追加(重複の確認なし)'
    task :add, ['path'] => :environment do |_task, args|
        puts "# 売却体験談の追加"

        if args.path.blank?
            puts 'ファイル名を指定してください'
            puts 'rake manager_review:add["fileName"]'
            exit
        end

        puts 'Reviews Adding...'
        puts "FileName: #{args.path}"
        puts "#######################"

        before_count = Review.count

        # Enum Mapping
        gender = { '男性' => 0, '女性' => 1, 'その他・不明' => 2 }
        building_type = { 'マンション' => 0, '戸建て' => 1, '土地' => 2 }
        times_type = { '初めて' => 0, '2回目' => 1, '3回以上' => 2 }
        
        
        csv = Rails.root.join(args.path)

        ## Adding
        ActiveRecord::Base.transaction do
            CSV.foreach(csv, headers: true) do |data|
                # 店舗取得
                branch = Branch.find(data['branch_id'])
                # 住所取得
                prefecture = Prefecture.find_by(name: data['prefecture'])
                city = City.find_by(name: data['city'])

                print "\r処理中: #{$.}件目"

                # Review
                review = branch.reviews.create({
                    prefecture_id: prefecture.id,
                    city_id: city.id,
                    name: data['name'],
                    gender: gender[data['gender']],
                    age: data['age'],
                    address: data['address'],
                    building_type: building_type[data['building_type']],
                    times_type: times_type[data['times']],
                    consider_season: data['consider_season'],
                    assesment_season: data['assesment_season'],
                    po_season: data['po_season'],
                    sale_season: data['sale_season'],
                    delivery_season: data['delivery_season'],
                    speed_cs: data['speed_cs'],
                    assesment_price: data['assesment_price'],
                    sale_price: data['sale_price'],
                    is_price_down: data['is_price_down'],
                    price_down_month: data['price_down_month'],
                    price_down_amount: data['price_down_amount'],
                    close_price: data['close_price'],
                    price_cs: data['price_cs'],
                    contract_type: (data['contract_type'].to_i - 1),
                    title: data['title'],
                    sale_reason_type: data['sale_reason_type'].to_i == 99 ? data['sale_reason_type'].to_i  : data['sale_reason_type'].to_i - 1,
                    anxiety: data['anxiety'],
                    decision_reason: data['decision_reason'],
                    support_cs: data['support_cs'],
                    support_reason: data['support_reason'],
                    advice: data['advice'],
                    request: data['request']
                })
            end

            print "\r" # progress消去
        end

        after_count = Review.count

        puts "Review: #{after_count - before_count}件 追加しました"
        raise "挿入件数が0件です" if (after_count - before_count) == 0
    rescue ActiveRecord::RecordNotFound
        Rails.logger.error '[ERROR]'
        Rails.logger.error 'branch_id/Prefecture/Cityのいずれかが間違っています'
    rescue TypeError
        Rails.logger.error '[ERROR]'
        Rails.logger.error '定義に一致するCSVファイルが見つかりません'
    rescue => err
        Rails.logger.error '挿入中に未知のエラーが発生しました'
        Rails.logger.error err
        Rails.logger.error err.class
    end


    desc '売却体験談の公開'
    task :public, ['review_id'] => :environment do |_task, args|
        puts "# 売却体験談の公開"
        puts "#######################"

        if args.review_id.blank?
            puts '体験談IDを指定してください'
            puts 'rake manager_review:public["review_id"]'
            exit
        end
        
        review = Review.find(args.review_id).update(is_public: true)

    rescue ActiveRecord::RecordNotFound
        Rails.logger.error '[ERROR]'
        Rails.logger.error '対象体験談が見つかりません'
    rescue => err
        Rails.logger.error '変更中に未知のエラーが発生しました'
        Rails.logger.error err
        Rails.logger.error err.class
    end

    desc '売却体験談の非公開'
    task :private, ['review_id'] => :environment do |_task, args|
        puts "# 売却体験談の非公開"
        puts "#######################"
        if args.review_id.blank?
            puts '体験談IDを指定してください'
            puts 'rake manager_review:private["review_id"]'
            exit
        end

        review = Review.find(args.review_id).update(is_public: false)

    rescue ActiveRecord::RecordNotFound
        Rails.logger.error '[ERROR]'
        Rails.logger.error '対象体験談が見つかりません'
    rescue => err
        Rails.logger.error '変更中に未知のエラーが発生しました'
        Rails.logger.error err
        Rails.logger.error err.class
    end
end
