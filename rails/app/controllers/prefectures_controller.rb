class PrefecturesController < ApplicationController
    def index
        @prefecture = Prefecture.find(params[:id])
        @branches = Branch.where(prefecture_id: params[:id])
        @cities = City.where(prefecture_id: params[:id])
        @branch_reviews = []
        @average_score = []
        @branches.each do |branch|
            @target_reviews = Review.where(branch_id: branch.id)
            @average_score = (@target_reviews.average(:speed_cs) + @target_reviews.average(:price_cs) + @target_reviews.average(:support_cs)) / 3
            @branch_reviews.push(@target_reviews)
        end
    end
end
