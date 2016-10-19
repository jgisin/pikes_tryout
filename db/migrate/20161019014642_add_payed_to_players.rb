class AddPayedToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :payed, :boolean
  end
end
