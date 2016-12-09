class AddFriendlyIdToProducts < ActiveRecord::Migration[5.0]

  def change
    add_column :products, :friendly_id, :string
    add_index :products, :friendly_id, :unique => true
  end

end
