class PrefecturesController < ApplicationController
    def index
        @prefecture = Prefecture.where(name: params[:name]).first
        if @prefecture.present?
            @branches = Branch.where(prefecture_id: @prefecture.id)
            @cities = City.where(prefecture_id: @prefecture.id)
            @branch_reviews = []
            @average_score = []
            @branches.each do |branch|
                @target_reviews = Review.where(branch_id: branch.id)
                @average_score = (@target_reviews.average(:speed_cs) + @target_reviews.average(:price_cs) + @target_reviews.average(:support_cs)) / 3
                @branch_reviews.push(@target_reviews)
            end
        else
            redirect_to "/error"
        end
    end
end
