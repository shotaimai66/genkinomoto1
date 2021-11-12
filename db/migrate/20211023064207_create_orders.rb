class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :item, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.integer :quantity
      t.datetime :paid_at
      t.integer :payment_id

      t.timestamps
    end
  end
end
