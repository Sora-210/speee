class ReviewController < ApplicationController
    def index
        @reviews = Review.all
      end
      def show
        @review = Review.eager_load({branch: :company}, :prefecture, :city).find(params[:id])
      end
      
end
