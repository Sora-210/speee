class PrefecturesController < ApplicationController
    def show
        @prefecture = Prefecture.find_by(name: params[:name])
        return render template: 'errors/404', status: 404, layout: 'error', content_type: 'text/html' if @prefecture.blank?
        @branches = Branch.where(prefecture_id: @prefecture.id)
        return render template: 'errors/404', status: 404, layout: 'error', content_type: 'text/html' if @branches.blank?
        @cities = @prefecture.cities
    end
end
