class Building < ApplicationRecord
    belongs_to :address, foreign_key: "address_id"
    belongs_to :customer, foreign_key: "customer_id"
    has_many :batteries
end
