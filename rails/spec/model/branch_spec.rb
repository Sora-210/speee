# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Branch, type: :model do
  describe 'Score Methods' do
    before do
      create(:prefectures)
      create(:cities)
      create(:companies)
    end

    let!(:branch) do
      create(:branches)
    end

    it 'reviewがないとき0スコア' do
      expect(branch.all_average_score).to eq(0)
      expect(branch.speed_average_score).to eq(0)
      expect(branch.price_average_score).to eq(0)
      expect(branch.support_average_score).to eq(0)
    end

    it 'reviewが一件の時等しくなる' do
      review = create(:reviews)
      all_average = ((review.speed_cs + review.price_cs + review.support_cs) / 3.to_f)
      expect(branch.all_average_score).to eq(all_average.round(1))
      expect(branch.speed_average_score).to eq(review.speed_cs)
      expect(branch.price_average_score).to eq(review.price_cs)
      expect(branch.support_average_score).to eq(review.support_cs)
    end
  end
end
