class Battery < ApplicationRecord
    belongs_to :building, foreign_key: "building_id"
    belongs_to :employee, foreign_key: "employee_id"
    has_many :columns

end
