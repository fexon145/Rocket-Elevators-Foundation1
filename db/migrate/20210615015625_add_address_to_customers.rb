class AddAddressToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :company_headquarters_address, index: true
    add_foreign_key :customers, :addresses, column: :company_headquarters_address_id
  end
end
