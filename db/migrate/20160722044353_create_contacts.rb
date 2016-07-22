class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :home_phone
      t.string :cell_phone
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
