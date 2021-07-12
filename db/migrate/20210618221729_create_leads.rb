class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :full_name
      t.string :email
      t.string :phone_number
      t.string :company_name
      t.string :project_name
      t.string :project_description
      t.string :departement
      t.string :message

      t.timestamps
    end
  end
end
