class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :cart, null: false, foreign_key: true
      t.integer :subtotal
      t.integer :tax
      t.integer :shipping_fee
      t.integer :total

      t.timestamps
    end
  end
end
