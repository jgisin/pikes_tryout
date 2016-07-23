class AddPlayerRefToContacts < ActiveRecord::Migration[5.0]
  def change
    add_reference :contacts, :player, index: true
  end
end
