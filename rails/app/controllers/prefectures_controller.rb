class PrefecturesController < ApplicationController
    def show
        @prefecture = Prefecture.find_by(name: params[:name])
        if !@prefecture.present?
            return 
        end
            @branches = Branch.where(prefecture_id: @prefecture.id)
            @cities = @prefecture.cities
    end
end
