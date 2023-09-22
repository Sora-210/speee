class CompaniesController < ApplicationController
    def show
      @branch = Branch.includes(:prefecture, :city, :reviews).find(params[:branch_id])
      @company = @branch.company
      # 必要に応じて他の処理を追加
    end
  end
  