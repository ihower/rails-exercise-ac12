class CreateCats < ActiveRecord::Migration[5.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :image
      t.integer :counter, :default => 0
      t.timestamps
    end
  end
end
