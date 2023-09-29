# frozen_string_literal: true

class CitiesController < ApplicationController
  def show
    @is_no_index = false
    @prefecture = Prefecture.find_by(name: params[:prefecture_name])
    @city = City.find_by(name: params[:name])
    return render template: 'errors/404', status: :not_found, layout: 'error', content_type: 'text/html' if @city.blank?

    @branches = Branch.joins(:assessment_areas).where(assessment_areas: { city_id: @city.id })
    if @branches.blank?
      return render template: 'errors/404', status: :not_found, layout: 'error',
                    content_type: 'text/html'
    end

    @is_no_index = @city.no_index?
  end
end
