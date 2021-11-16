class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :item, foreign_key: true
      t.references :cart, foreign_key: true
      t.integer :quantity
      t.datetime :paid_at
      t.integer :payment_id
      t.integer :adult_number
      t.integer :child_number

      t.timestamps
    end
  end
end
