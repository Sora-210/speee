class PrefecturesController < ApplicationController
    def show
        @prefecture = Prefecture.where(name: params[:id]).first
        if !@prefecture.present?
            return 
        end
            @branches = Branch.where(prefecture_id: @prefecture.id)
            @cities = City.where(prefecture_id: @prefecture.id)
            @branch_reviews = []
            @average_score = []
            @branches.each do |branch|
                @target_reviews = Review.where(branch_id: branch.id)
                @average_score = (@target_reviews.average(:speed_cs) + @target_reviews.average(:price_cs) + @target_reviews.average(:support_cs)) / 3
                @branch_reviews.push(@target_reviews)
            end
    end
end
