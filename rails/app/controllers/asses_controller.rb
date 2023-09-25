require 'net/http'
require 'uri'

class AssesController < ApplicationController
    def index
    end
    def create
      @branch = Branch.find(params[:branch_id])
      if @branch.nil?
        puts "branch not found"
        return
      end
      if !validiate_phone(params)
        @branch.errors.add(:phone, "invalid phone number")
        puts "invalid phone number"
        render :index
      elsif !validiate_email(params)
        @branch.errors.add(:email, "invalid email")
        puts "invalid email"
        render :index
      elsif
         # TODO:ストロングパラメーターにリファクタリングを行う
        @asses = Assesment.new(:city_id => @branch.city_id ,:prefecture_id => @branch.prefecture_id ,:branch_id => @branch.id, :last_name => params[:last_name], :first_name => params[:first_name], :last_name_kana => params[:last_name_kana], :first_name_kana => params[:first_name_kana], :tel => params[:phone], :email => params[:email], :address => params[:address], :building_type => params[:building_type].to_i, :exclusive_area => params[:exclusive_area].to_i, :land_area => params[:land_area].to_i, :building_area => params[:building_area].to_i, :room_plan_type => params[:room_plan_type].to_i, :constructed_year => params[:constructed_year].to_i)
        if @asses.save
          post_to_external_api_with_net_http(@asses)
        else
        end
      end
    end
    private
    
    def validiate_email(params)
      # TODO:モデル側の責務であるため、処理を移動する
      if params[:email].match(/^[a-zA-Z0-9_.+-]+@([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+[a-zA-Z]{2,}$/)
        return true
      else
        return false
      end
    end
    def validiate_phone(params)
       # TODO:モデル側の責務であるため、処理を移動する
      if params[:phone].match(/\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/)
        return true
      else
        return false
      end
    end
    private

    def post_to_external_api_with_net_http(assesment)
      uri = URI.parse("https://miniul-api.herokuapp.com/affiliate/v2/conversions")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})

      request_data = {
          branch_id: assesment.branch_id,
          property_city: assesment.city_id,
          property_address: assesment.address,
          property_type: assesment.building_type,
          property_exclusive_area: assesment.exclusive_area,
          property_land_area: assesment.land_area,
          property_building_area: assesment.building_area,
          url_param: "2",
          property_room_plan: assesment.room_plan_type,
          property_constructed_year: assesment.constructed_year,
          user_email: assesment.email,
          user_name: "#{assesment.last_name} #{assesment.first_name}",
          user_name_kana: "#{assesment.last_name_kana} #{assesment.first_name_kana}",
          user_tel: assesment.tel
      }

      request.body = request_data.to_json

      response = http.request(request)


    end
  end
  