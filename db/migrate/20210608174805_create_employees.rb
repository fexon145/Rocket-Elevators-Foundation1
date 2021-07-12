class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t| #employee is wrapper
      t.string :last_name
      t.string :first_name
      t.string :title
      t.timestamps
    end
  end
end


# https://www.xyzpub.com/en/ruby-on-rails/3.2/activerecord_datenbank_anlegen.html

# generate rails model in ubuntu: rails generate model NAME [field[:type][:index] field[:type][:index]] [options]
#   rake db:migrate
# run the above, enter in ubuntu: rails db:seed