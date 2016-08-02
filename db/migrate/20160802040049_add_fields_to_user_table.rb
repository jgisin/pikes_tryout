class AddFieldsToUserTable < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :height, :string
    add_column :players, :weight, :string
  end
end
