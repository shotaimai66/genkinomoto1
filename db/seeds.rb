# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Store.create!(
  name: "ゲンキノモト。厚木店",
  phone: "046-000-0001",
  email: "genkinomoto-atsugi@email.com",
  line_id: "genkinomoto_line_dummy",
  address: "神奈川県 厚木市 中央",
  description: Faker::Lorem.sentences(number: 10),
  opening_time: Time.current.beginning_of_day + 36000, # 10:00:00
  closing_time: Time.current.beginning_of_day + 72000, # 20:00:00
  last_order_time: Time.current.beginning_of_day + 68400, # 20:00:00
  non_business_day: "水曜日",
  image: File.open("app/assets/images/store1.jpg")
)

Store.create!(
  name: "ゲンキノモト。平塚店",
  address: "神奈川県 平塚市 某所",
  phone: "046-000-0002",
  email: "genkinomoto-hiratsuka@email.com",
  line_id: "genkinomoto_line_dummy",
  description: Faker::Lorem.sentences(number: 10),
  opening_time: Time.current.beginning_of_day + 36000, # 10:00:00
  closing_time: Time.current.beginning_of_day + 72000, # 20:00:00
  last_order_time: Time.current.beginning_of_day + 68400, # 20:00:00
  non_business_day: "水曜日",
  image: File.open("app/assets/images/store1.jpg")
)

Store.create!(
  name: "ゲンキノモト。小田原店",
  address: "神奈川県 小田原市 某所",
  phone: "046-000-0003",
  email: "genkinomoto-odawara@email.com",
  line_id: "genkinomoto_line_dummy",
  description: Faker::Lorem.sentences(number: 10),
  opening_time: Time.current.beginning_of_day + 36000, # 10:00:00
  closing_time: Time.current.beginning_of_day + 72000, # 20:00:00
  last_order_time: Time.current.beginning_of_day + 68400, # 20:00:00
  non_business_day: "水曜日",
  image: File.open("app/assets/images/store1.jpg")
)

Store.create!(
  name: "ゲンキノモト。イベント開場A",
  address: "神奈川県 海老名市 某所",
  phone: "046-000-0004",
  email: "genkinomoto-event@email.com",
  line_id: "genkinomoto_line_dummy",
  description: Faker::Lorem.sentences(number: 10),
  opening_time: Time.current.beginning_of_day + 36000, # 10:00:00
  closing_time: Time.current.beginning_of_day + 72000, # 20:00:00
  last_order_time: Time.current.beginning_of_day + 68400, # 20:00:00
  non_business_day: "水曜日",
  image: File.open("app/assets/images/event_site1.jpg")
)

60.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  store_id = 1
    User.create!(
      name: name,
      email: email,
      password: password,
      password_confirmation: password,
      store_id: store_id
    )
end

10.times do |n|
  name  = Faker::Name.name
  email = "staff-#{n+1}@email.com"
  password = "password"
  store_id = 1
  Staff.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    store_id: store_id
  )
end

20.times do |n|
  name = "商品#{n+1} サンプル ボディケア専用オイル 250ml"
  price = (n+1)*100
  description = Faker::Lorem.sentences(number: 10)
  stock = (n+1)
    Item.create!(
      name: name,
      price: price,
      description: description,
      stock: stock,
      image: File.open("app/assets/images/item2.jpg")
    )
end

20.times do |n|
  title = "イベント-#{n+1} サンプルイベント"
  category = "屋外イベント"
  price = (n+1)*1000
  description = Faker::Lorem.sentences(number: 10)
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
