class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :category
      t.integer :price
      t.string :image
      t.string :description
      t.string :location
      t.date :first_date
      t.date :last_date
      t.time :start_time
      t.time :end_time
      t.time :start_time_alt
      t.time :end_time_alt
      t.integer :ticket_numbers
      t.boolean :status, default: false, null: false
      t.integer :owner_id
      t.integer :store_id
      
      t.timestamps
    end
  end
end
