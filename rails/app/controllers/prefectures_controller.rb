class PrefecturesController < ApplicationController
    def show
        @prefecture = Prefecture.find_by(name: params[:name])
        if @prefecture.blank?
            render template: 'errors/404', status: 404, layout: 'error', content_type: 'text/html'
            return 
        end
            @branches = Branch.where(prefecture_id: @prefecture.id)
            @cities = @prefecture.cities
    end
end
