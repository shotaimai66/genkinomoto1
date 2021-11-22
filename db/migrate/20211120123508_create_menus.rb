class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :title
      t.string :description
      t.integer :charge
      t.integer :treatment_time
      t.integer :course_number, default: 0
      t.integer :store_id, default: 1

      t.timestamps
    end
  end
end
