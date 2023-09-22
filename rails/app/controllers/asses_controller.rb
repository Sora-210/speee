class AssesController < ApplicationController
    def index
    end
    def create
      if validiate_phone(params)
        puts "CCCCCCCC"
      else
        puts "DDDDDDDD"
      end
    end
    private
    
    def validiate_phone(params)
      if params[:phone].match(/\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/)
        puts "AAAAAAAA"
        return true
      else
        puts "BBBBB"
        return false
      end
    end
  end
  