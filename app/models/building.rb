class Building < ApplicationRecord
    belongs_to :address_of_the_building, class_name: "Address", optional: true
    belongs_to :customer, class_name: "Customer", optional: true
    has_one :building_detail
    has_many :batteries 
end
