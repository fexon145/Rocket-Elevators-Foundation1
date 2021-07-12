class Employee < ApplicationRecord
    belongs_to :user, class_name: "User"
    has_many :batteries
end
