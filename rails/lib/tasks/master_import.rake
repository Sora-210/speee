require 'csv'

namespace :master_import do
    desc '都道府県マスターのインポート'
    task :prefectures, ['path'] => :environment do |task, args|
        puts 'Prefectures Master Importing...'
        before_count = Prefecture.count

        begin
            csv = Rails.root.join(args.path.blank? ? 'prefecture.csv' : args.path)

            ActiveRecord::Base.transaction do
                CSV.foreach(csv, headers: true) do |data|
                    Prefecture.create({
                        id: data['id'],
                        name: data['name']
                    })
                end
            end

            after_count = Prefecture.count
            puts 'Prefecture: #{after_count - before_count}件 挿入しました'
        rescue ActiveRecord::RecordNotUnique
            puts '[ERROR]'
            puts 'IDが重複しています'
            puts 'イエウールと共通のIDのためTABLEを作り直して挿入してください'
        rescue TypeError
            puts '[ERROR]'
            puts '定義に一致するCSVファイルが見つかりません'
        rescue => err
            puts '挿入中に未知のエラーが発生しました'
            puts err
            puts err.class
        end
    end
    
    desc '市区町村マスターのインポート'
    task :cities, ['path'] => :environment do |task, args|
        puts 'Cities Master Importing...'
        before_count = City.count

        begin
            csv = Rails.root.join(args.path.blank? ? 'city.csv' : args.path)

            CSV.foreach(csv, headers: true) do |data|
                ActiveRecord::Base.transaction do
                    City.create({
                        id: data['id'],
                        prefecture_id: data['prefecture_id'],
                        name: data['name'],
                        yomi: data['yomi']
                    })
                end
            end

            after_count = City.count
            puts 'City: #{after_count - before_count}件 挿入しました'
        rescue ActiveRecord::RecordNotUnique
            puts '[ERROR]'
            puts 'IDが重複しています'
            puts 'イエウールと共通のIDのためTABLEを作り直して挿入してください'
        rescue TypeError
            puts '[ERROR]'
            puts '定義に一致するCSVファイルが見つかりません'
        rescue => err
            puts '挿入中に未知のエラーが発生しました'
            puts err
            puts err.class
        end
    end
    
    desc '企業マスターのインポート'
    task :companies, ['path'] => :environment do |task, args|
        puts 'Companies/branches/Assesment_Areas Master Importing...'

        before_company_count = Company.count
        before_branch_count = Branch.count
        before_assesment_area_count = AssesmentArea.count

        begin
            csv = Rails.root.join(args.path.blank? ? 'company.csv' : args.path)

            CSV.foreach(csv, headers: true) do |data|
                # puts data
                ActiveRecord::Base.transaction do
                    # Company
                    company = Company.find_or_create_by(id: data['company_id']) do |company|
                        company.name = data['name']
                    end

                    # 住所取得
                    prefecture = Prefecture.find_by(name: data['prefecture'])
                    city = City.find_by(name: data['city'])

                    # Branch
                    branch = company.branches.create({
                        name: data['branch_name'].blank? ? '' : data['branch_name'],
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

                    # Assesment_Area
                    data['assesment_areas'].split(',').each do |assesment_area_city_id|
                        branch.assesment_areas.create(
                            city_id: assesment_area_city_id
                        )
                    end
                end
            end

            after_company_count = Company.count
            after_branch_count = Branch.count
            after_assesment_area_count = AssesmentArea.count

            puts 'Company: #{after_company_count - before_company_count}件 挿入しました'
            puts 'Branch: #{after_branch_count - before_branch_count}件 挿入しました'
            puts 'AssesmentArea: #{after_assesment_area_count - before_assesment_area_count}件 挿入しました'
        rescue ActiveRecord::RecordNotUnique
            puts '[ERROR]'
            puts 'IDが重複しています'
            puts 'イエウールと共通のIDのためTABLEを作り直して挿入してください'
        rescue TypeError
            puts '[ERROR]'
            puts '定義に一致するCSVファイルが見つかりません'
        rescue => err
            puts '挿入中に未知のエラーが発生しました'
            puts err
            puts err.class
        end
    end
end
