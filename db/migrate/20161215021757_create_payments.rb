class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :order_id

      t.string :payment_method

      t.integer :amount

      #t.boolean :paid, :default => false
      t.datetime :paid_at

      t.text :params

      t.timestamps
    end

    add_index :payments, :order_id

    add_column :orders, :status, :string, :default => "pending"
    add_column :orders, :payment_status, :string, :default => "pending"
  end

end
