# frozen_string_literal: true

class BranchesController < ApplicationController
  def show
    @branch = Branch.eager_load(:prefecture, :city, :reviews).find(params[:id])
    @company = @branch.company
  end
end
