# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do |n|
  name = "商品#{n+1} サンプル ボディケア専用オイル 250ml 
          ボディメンテ専用 ウェブ限定"
  price = (n+1)*100
  description = "これは 商品#{n+1} です。サンプル ボディケア専用オイル 250ml 
                 ボディメンテ専用 ウェブ限定サンプル ボディケア専用オイル 250ml
                 ボディメンテ専用 ウェブ限定サンプル ボディケア専用オイル 250ml
                 ボディメンテ専用 ウェブ限定サンプル ボディケア専用オイル 250ml
                 ボディメンテ専用 ウェブ限定サンプル ボディケア専用オイル 250ml
                 ボディメンテ専用 ウェブ限定サンプル ボディケア専用オイル 250ml"
  stock = (n+1)
    Item.create!(
      name: name,
      price: price,
      description: description,
      stock: stock,
      image: File.open("app/assets/images/item2.jpg")
    )
end

User.create!(
  name: "Sample User1",
  email: "sample-1@email.com",
  password: "password",
  password_confirmation: "password"
)

Staff.create!(
  name: "Sample Staff1",
  email: "staff-1@email.com",
  password: "password",
  password_confirmation: "password"
)
