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
        puts "valid!"
        @asses = Assesment.new(:city_id => @branch.city_id ,:prefecture_id => @branch.prefecture_id ,:branch_id => @branch.id, :last_name => params[:last_name], :first_name => params[:first_name], :last_name_kana => params[:last_name_kana], :first_name_kana => params[:first_name_kana], :tel => params[:phone], :email => params[:email], :address => params[:address], :building_type => params[:building_type].to_i, :exclusive_area => params[:exclusive_area].to_i, :land_area => params[:land_area].to_i, :building_area => params[:building_area].to_i, :room_plan_type => params[:room_plan_type].to_i, :constructed_year => params[:constructed_year].to_i)
        if @asses.save
          puts "saved"
        else
          puts "not saved"
          puts @asses.errors.full_messages
        end
      end
    end
    private
    
    def validiate_email(params)
      if params[:email].match(/^[a-zA-Z0-9_.+-]+@([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+[a-zA-Z]{2,}$/)
        return true
      else
        return false
      end
    end
    def validiate_phone(params)
      if params[:phone].match(/\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/)
        return true
      else
        return false
      end
    end
  end
  