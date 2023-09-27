# frozen_string_literal: true

class Assesment < ApplicationRecord
  belongs_to :branch
  belongs_to :prefecture
  belongs_to :city

  enum :building_type, { apartment_house: 0, detached_house: 1, land: 2 }, prefix: true
  enum room_plan_type: {
    r1: 0, 
    k1: 1, 
    lk1: 2, 
    k2: 3, 
    lk2: 4, 
    k3: 5, 
    lk3: 6, 
    k4: 7, 
    lk4: 8, 
    k5: 9, 
    lk5: 10, 
    k6: 11, 
    lk6: 12, 
    over: 13
  }, prefix: true
end
