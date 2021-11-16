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

Store.create!(
  name: "厚木店",
  address: "神奈川県 七沢温泉郷 七沢荘"
)


User.create!(
  name: "Sample User1",
  email: "sample-1@email.com",
  password: "password",
  password_confirmation: "password",
  store_id: 1
)

Staff.create!(
  name: "Sample Staff1",
  email: "staff-1@email.com",
  password: "password",
  password_confirmation: "password",
  store_id: 1
)

20.times do |n|
  title = "イベント-#{n+1} サンプルイベント"
  category = "屋外イベント"
  price = (n+1)*1000
  description = "これは イベント-#{n+1} です。これは イベント-#{n+1} です。これは イベント-#{n+1} です。これは イベント-#{n+1} です。これは イベント-#{n+1} です。"
  remaining_ticket_numbers = (n+1)
  location = "神奈川県厚木市"
  first_date = Date.current + 28
  last_date = Date.current + 48
  start_time = Time.current.beginning_of_day + 36000 # 10:00:00
  end_time = Time.current.beginning_of_day + 72000 # 20:00:00
    Event.create!(
      title: title,
      category: category,
      price: price,
      description: description,
      remaining_ticket_numbers: remaining_ticket_numbers,
      location: location,
      first_date: first_date,
      last_date: last_date,
      start_time: start_time,
      end_time: end_time,
      image: File.open("app/assets/images/event1.jpg")
    )
end
