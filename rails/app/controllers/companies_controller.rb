class CompaniesController < ApplicationController
    def show
      @branch = Branch.includes(:prefecture, :city, :reviews).find(params[:branch_id])
      @company = @branch.company
      @speed_cs_avg = @branch.reviews.average(:speed_cs)
      @price_cs_avg = @branch.reviews.average(:price_cs)
      @support_cs_avg = @branch.reviews.average(:support_cs)
      @overall_avg = (@speed_cs_avg + @price_cs_avg + @support_cs_avg) / 3.0
    end
  end
  