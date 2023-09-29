# frozen_string_literal: true

class PrefecturesController < ApplicationController
  def show
    @prefecture = Prefecture.find_by(name: params[:name])
    if @prefecture.blank?
      return render template: 'errors/404', status: :not_found, layout: 'error',
                    content_type: 'text/html'
    end

    @branches = Branch.joins(assessment_areas: :city).where(assessment_areas: { cities: { prefecture_id: @prefecture.id } }).distinct
    if @branches.blank?
      return render template: 'errors/404', status: :not_found, layout: 'error',
                    content_type: 'text/html'
    end

    @cities = @prefecture.cities
  end
end
