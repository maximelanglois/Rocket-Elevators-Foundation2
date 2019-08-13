class Intervention < ApplicationRecord
    belongs_to :battery, foreign_key: "battery_id", optional: true
    belongs_to :column, foreign_key: "column_id", optional: true
    belongs_to :elevator, foreign_key: "elevator_id", optional: true
    belongs_to :employee, foreign_key: "employee_id"
    belongs_to :building, foreign_key: "building_id"
    belongs_to :customer, foreign_key: "customer_id"
end
