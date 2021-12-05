class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :cart, foreign_key: true
      t.integer :subtotal
      t.integer :tax
      t.integer :shipping_fee
      t.integer :total
      t.time :checked_at # お客様の注文をスタッフが確認したかどうか
      t.timestamps
    end
  end
end
