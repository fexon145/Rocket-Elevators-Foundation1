class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.belongs_to :author, Foreign_key: {to_table: :employees}
      t.belongs_to :customer, Foreign_key: {to_table: :customers}
      t.belongs_to :building, Foreign_key: {to_table: :buildings}
      t.belongs_to :battery, Foreign_key: {to_table: :batterys}
      t.belongs_to :column, Foreign_key: {to_table: :columns}
      t.belongs_to :elevator, Foreign_key: {to_table: :elevators}
      t.belongs_to :employee, Foreign_key: {to_table: :employees}
      t.datetime :startdate
      t.string :enddate
      t.string :result
      t.text :report
      t.string :status

      t.timestamps
    end
  end
end
