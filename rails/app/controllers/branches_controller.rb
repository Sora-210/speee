# frozen_string_literal: true

class BranchesController < ApplicationController
  def show
    @branch = Branch.eager_load(:prefecture, :city, :reviews).find(params[:id])
    @company = @branch.company
    averages = Review.where(branch_id: @branch.id).pick(Arel.sql('AVG(speed_cs), AVG(price_cs), AVG(support_cs)'))
    @speed_cs_avg = averages[0]
    @price_cs_avg = averages[1]
    @support_cs_avg = averages[2]
    @overall_avg = (@speed_cs_avg + @price_cs_avg + @support_cs_avg) / 3.0
  end
end
