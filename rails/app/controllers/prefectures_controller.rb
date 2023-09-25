class PrefecturesController < ApplicationController
    def show
        @prefecture = Prefecture.find_by(name: params[:id])
        if !@prefecture.present?
            return 
        end
            @branches = Branch.where(prefecture_id: @prefecture.id)
            @cities = City.where(prefecture_id: @prefecture.id)
            @branch_reviews = []
            @average_score = []
            @branches.each do |branch|
                @target_reviews = Review.where(branch_id: branch.id)
                @average_score = branch.all_average_score
                @branch_reviews.push(@target_reviews)
            end
    end
end
