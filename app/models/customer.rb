class Customer < ApplicationRecord
    belongs_to :address, foreign_key: "address_id"
    belongs_to :user, foreign_key: "user_id"
    has_many :interventions
end
