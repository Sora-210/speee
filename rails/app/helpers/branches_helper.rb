module BranchesHelper
    def create_description(branch)
        "#{branch.company.name}#{branch.name}で実際に不動産売却や不動産購入をした人の口コミや評判を掲載しています！"
    end
    def create_keywords(branch)
        "不動産会社,#{branch.company.name},#{branch.name.blank? ? "," : "#{branch.name}," }口コミ,評判"
    end
end
