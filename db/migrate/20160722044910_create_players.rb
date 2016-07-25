class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :dob
      t.string :present_team
      t.string :level
      t.string :ired_position

      t.timestamps
    end
  end
end
