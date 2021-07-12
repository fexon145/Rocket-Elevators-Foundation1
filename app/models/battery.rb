class Battery < ApplicationRecord
    belongs_to :building, class_name: "Building", optional: true
    belongs_to :employee, class_name: "Employee", optional: true
    has_many :columns
end
