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
    duplication_count = @city.calculate_prefecture_branch_ids_duplicate_ids
    if duplication_count[:prefecture_branch_ids_count] * 0.8 <= duplication_count[:duplicate_ids_count]
      @is_no_index = true
      end
  end
end
  