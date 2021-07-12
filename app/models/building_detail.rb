class BuildingDetail < ApplicationRecord
    belongs_to :building, class_name: "Building", optional: true
end
