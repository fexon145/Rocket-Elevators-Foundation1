class Intervention < ApplicationRecord
    validates :author_id, presence: true
    validates :customer_id, presence: true
    validates :building_id, presence: true
    validate :intervention_valid


    belongs_to :author, class_name: "Employee"
    belongs_to :customer, class_name: "Customer"
    belongs_to :building, class_name: "Building"
    belongs_to :battery, class_name: "Battery", optional: true
    belongs_to :column, class_name: "Column", optional: true
    belongs_to :elevator, class_name: "Elevator", optional: true
    belongs_to :employee, class_name: "Employee", optional: true


    def intervention_valid
        if !self.battery_id && !self.column_id && !self.elevator_id
            errors.add(:you, ' select one of them ')
        end
    end
end
