# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  describe '#no_index?' do
    context 'when 80% or more of the branches in prefecture are the same as city branches' do
      before do
        create(:prefectures)
        @city = create(:cities)
        create(:cities, id: 2)
        create(:companies)
        
        # 修正途中
        (1..8).to_a.each { |id| create(:branches, id:) }
        (9..10).to_a.each { |id| create(:branches, id:, city_id: 2) }

        (1..8).to_a.each { |id| create(:assessment_areas, id: id, branch_id: id) }
      end

      xit 'returns true' do
        expect(@city.no_index?).to be true
      end
    end

    context 'when less than 80% of the brancheses in prefecture are the same as city brancheses' do
      before do
        create(:prefectures)
        @city = create(:cities)
        create(:cities, id: 2)
        create(:companies)
        create(:assessment_areas)

        # 修正途中
        (1..6).to_a.each { |id| create(:branches, id:) }
        (7..10).to_a.each { |id| create(:branches, id:, city_id: 2) }

        (1..6).to_a.each { |id| create(:assessment_areas, id: id, branch_id: id) }
      end

      xit 'returns false' do
        expect(@city.no_index?).to be false
      end
    end
  end
end
