require 'csv'

namespace :manager_review do
    desc 'コマンドヘルプの表示'
    task help: :environment do
        puts "######################"
        puts "[manager_review help]"
        puts "manager_review:add['fileName']        売却体験談の追加(重複の確認なし)"
        puts "manager_review:generate               更新用テンプレートの出力"
        puts "manager_review:update['fileName']     売却体験談の更新(各項目更新/公開設定)"
        puts "manager_review:public['reviewId']     売却体験談の公開"
        puts "manager_review:private['reviewId']    売却体験談の非公開"
        puts "######################"
    end
end
