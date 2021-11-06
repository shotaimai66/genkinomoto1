class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :store_id, default: 1
      t.datetime :start_time
      t.datetime :end_time
      t.string :title_for_guest
      t.string :title_for_staff
      t.integer :course, default: 0
      t.integer :status, default: 0
      t.string :comment
      t.integer :staff_id
      t.integer :guest_id
      t.datetime :reservation_time
      t.boolean :holiday_flag, default: false

      t.timestamps
    end
  end
end
