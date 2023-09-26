class CitiesController < ApplicationController
  def show
    @is_no_index = false
    @prefecture = Prefecture.find_by(name: params[:prefecture_name])
    @city = City.find_by(name: params[:name])
    if @city.blank?
        render template: 'errors/404', status: 404, layout: 'error', content_type: 'text/html'
        return 
    end
    @branches = Branch.where(city_id: @city.id)
    if @branches.blank?
        render template: 'errors/404', status: 404, layout: 'error', content_type: 'text/html'
        return 
    end
    @prefecture_branch_ids = Branch.where(prefecture_id: @prefecture.id).pluck(:id)
    @city_branch_ids = Branch.where(city_id: @city.id).pluck(:id)
    @common_ids = @prefecture_branch_ids & @city_branch_ids
    @common_ids_count = @common_ids.count
    # 被り度が8割以上だったらフラグをtrueにするロジックを書く
end
  end
  