class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :name
      t.string :product_line
      t.numeric :number_of_appartement
      t.numeric :number_of_floor
      t.numeric :number_of_basement
      t.numeric :number_of_companies
      t.numeric :number_of_parking_spots
      t.numeric :number_of_elevators
      t.numeric :number_of_corporations
      t.numeric :maximum_occupancy
      t.numeric :business_hours
      t.string :unit_price_of_each_elevator
      t.string :total_price_of_elevators
      t.string :installation_fees
      t.string :final_price
      t.string :company_name
      t.string :email

      t.timestamps
    end
  end
end
