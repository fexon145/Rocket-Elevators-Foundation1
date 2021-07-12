class AddAddressToBuilding < ActiveRecord::Migration[5.2]
  def change
    add_reference :buildings, :address_of_the_building, index: true
    add_foreign_key :buildings, :addresses, column: :address_of_the_building_id
  end
end
