class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :treatment_detail
      t.integer :charge
      t.integer :treatment_time
      t.integer :store_id, default: 1

      t.timestamps
    end
  end
end
