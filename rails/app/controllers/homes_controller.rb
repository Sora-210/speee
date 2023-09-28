# frozen_string_literal: true

class HomesController < ApplicationController
  def index;
    @prefectures = Prefecture.all
  end
end
