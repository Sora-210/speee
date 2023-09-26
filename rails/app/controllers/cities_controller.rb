class CitiesController < ApplicationController
  def show
    @prefecture = Prefecture.find_by(name: params[:prefecture_name])
    @city = City.find_by(name: params[:name])
    if @city.blank?
        render template: 'errors/404', status: 404, layout: 'error', content_type: 'text/html'
        return 
    end
        @branches = Branch.where(city_id: @city.id)
end
  end
  