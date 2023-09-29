# frozen_string_literal: true

require 'net/http'
require 'uri'

class AssessmentsController < ApplicationController
  def index
    @assessment = Assessment.new

    if params[:branch_id].blank?
      return render template: 'errors/404', status: :not_found, layout: 'error',
                    content_type: 'text/html'
    end
    @branch = Branch.find(params[:branch_id])
  end

  def thanks; end

  def error; end

  def create
    @assessment = Assessment.new(assessment_params)
    unless @assessment.valid?
      @branch = Branch.find(params[:assessment][:branch_id])
      return render 'index'
    end
    response = post_to_external_api_with_net_http(@assessment)
    return redirect_to action: :thanks if response.code == '200'

    redirect_to action: :error
  end

  private

  def assessment_params
    params.require(:assessment).permit(:city_id, :prefecture_id, :branch_id, :last_name, :first_name,
                                       :last_name_kana, :first_name_kana, :tel, :email, :address, :building_type,
                                       :exclusive_area, :land_area, :building_area, :room_plan_type, :constructed_year)
  end

  def post_to_external_api_with_net_http(assessment)
    uri = URI.parse('https://miniul-api.herokuapp.com/affiliate/v2/conversions')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })

    request_data = {
      branch_id: assessment.branch_id,
      property_city: assessment.city_id,
      property_address: assessment.address,
      property_type: assessment.building_type,
      property_exclusive_area: assessment.exclusive_area,
      property_land_area: assessment.land_area,
      property_building_area: assessment.building_area,
      url_param: '2',
      property_room_plan: assessment.room_plan_type,
      property_constructed_year: assessment.constructed_year,
      user_email: assessment.email,
      user_name: "#{assessment.last_name} #{assessment.first_name}",
      user_name_kana: "#{assessment.last_name_kana} #{assessment.first_name_kana}",
      user_tel: assessment.tel
    }

    request.body = request_data.to_json

    http.request(request)
  end
end
