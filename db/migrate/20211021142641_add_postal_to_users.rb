class AddPostalToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postal_code, :integer
    add_column :users, :prefecture_code, :string
    add_column :users, :city, :string
    add_column :users, :street, :string
    add_column :users, :other_address, :string
  end
end
