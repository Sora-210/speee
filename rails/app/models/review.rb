class Review < ApplicationRecord
    belongs_to :prefecture
    belongs_to :city
    belongs_to :branch

    enum :gender, { male: 0, female: 1, other: 2 }, prefix: true
    enum :building_type, { apartment_house: 0, detached_house: 1, land: 2 }, prefix: true
    enum :times_type, { first: 0, second: 1, many: 2 }, prefix: true
    enum :contract_type, { privilegedand_exclusive: 0, exclusive: 1, general: 2, unknown: 3 }, prefix: true
    enum :sale_reason_type, { moving_house: 0, inheritance: 1, transfer_job: 2, divorce: 3, assets: 4, money: 5, other: 6 }, prefix: true
end
