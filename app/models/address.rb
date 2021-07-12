class Address < ApplicationRecord
    has_one :customer, foreign_key: :company_headquarters_address_id 
    has_one :building, foreign_key: :address_of_the_building_id
    has_many :google
end