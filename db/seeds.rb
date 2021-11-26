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

User.create!(
  name: "Sample User2",
  email: "sample-2@email.com",
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

Menu.create!(
  title: "フットケア40分",
  description: "フットケア40分",
  charge: 4000,
  treatment_time: 40,
  course_number: 1,
  store_id: 1
)

Menu.create!(
  title: "フットケア60分",
  description: "フットケア60分",
  charge: 6000,
  treatment_time: 60,
  course_number: 2,
  store_id: 1
)

Menu.create!(
  title: "マッサージ30分",
  description: "マッサージ30分",
  charge: 3000,
  treatment_time: 30,
  course_number: 3,
  store_id: 1
)

Menu.create!(
  title: "マッサージ60分",
  description: "マッサージ60分",
  charge: 6000,
  treatment_time: 60,
  course_number: 4,
  store_id: 1
)

Menu.create!(
  title: "マッサージ80分",
  description: "マッサージ80分",
  charge: 8000,
  treatment_time: 80,
  course_number: 5,
  store_id: 1
)

Menu.create!(
  title: "足つぼ30分",
  description: "足つぼ30分足つぼ30分",
  charge: 3000,
  treatment_time: 30,
  course_number: 6,
  store_id: 1
)

Menu.create!(
  title: "足つぼ45分",
  description: "足つぼ45分足つぼ45分",
  charge: 4500,
  treatment_time: 45,
  course_number: 7,
  store_id: 1
)