# frozen_string_literal: true

class ReviewsController < ApplicationController
  def show
    @review = Review.eager_load({ branch: :company }, :prefecture, :city).find(params[:id])
  end
end
