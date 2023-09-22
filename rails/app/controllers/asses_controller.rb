class AssesController < ApplicationController
    def index
    end
    def create
      if !validiate_phone(params)
        puts "invalid phone number"
      elsif !validiate_email(params)
        puts "invalid email"
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
  