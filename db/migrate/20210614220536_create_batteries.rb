class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.string :battery_type
      t.string :status
      t.string :date_of_commissioning
      t.string :date_of_last_inspection
      t.string :certificate_of_operations
      t.string :information
      t.text :notes

      t.timestamps
    end
  end
end
