# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound,   with: :render_four_oh_four
  rescue_from ActionController::RoutingError, with: :render_four_oh_four

  private

  def render_four_oh_four
    if request.format.to_sym == :json
      render json: { error: '404 Not Found' }, status: :not_found
    else
      render '/errors/404', status: :not_found, layout: 'error'
    end
  end
end
