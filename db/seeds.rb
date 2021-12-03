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
  name: "ゲンキノモト。厚木店",
  phone: "046-000-0001",
  email: "genkinomoto-atsugi@email.com",
  line_id: "genkinomoto_line_dummy",
  address: "神奈川県 厚木市 中央",
  description: "ゲンキノモト。本店です。お客様のご来店を心よりお待ちしております。",
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
  description: "ゲンキノモト。平塚店です。お客様のご来店を心よりお待ちしております。",
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
  description: "ゲンキノモト。小田原店です。お客様のご来店を心よりお待ちしております。",
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
  description: "ゲンキノモト。イベント開場です。お客様のご来店を心よりお待ちしております。",
  opening_time: Time.current.beginning_of_day + 36000, # 10:00:00
  closing_time: Time.current.beginning_of_day + 72000, # 20:00:00
  last_order_time: Time.current.beginning_of_day + 68400, # 20:00:00
  non_business_day: "水曜日",
  image: File.open("app/assets/images/event_site1.jpg")
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

Staff.create!(
  name: "Sample Staff2",
  email: "staff-2@email.com",
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
  category: "Foot Care　~フットケア~",
  category_order: 1,
  category_title: "初回",
  title_order: 1,
  title: "フットケア40分",
  charge: 4200,
  description: "下記から1つお選びください。
  ・足のネイルケア・タコ、ウオノメ除去
  ・角質除去・座りダコ",
  treatment_time: 40,
  course_number: 1,
  store_id: 1
  
)

Menu.create!(
  category: "Foot Care　~フットケア~",
  category_order: 1,
  category_title: "初回",
  title_order: 1,
  title: "フットケア60分",
  charge: 6300,
  description: "足全体のお手入れ",
  treatment_time: 60,
  course_number: 2,
  store_id: 1
)

Menu.create!(
  category: "Foot Care　~フットケア~",
  category_order: 1,
  category_title: "通常",
  title_order: 2,
  title: "ネイルケア 40分",
  charge: 6000,
  description: "（爪のカット・甘皮ケア・爪溝のゴミ除去・コーティング）",
  treatment_time: 40,
  course_number: 3,
  store_id: 1
)

Menu.create!(
  category: "Foot Care　~フットケア~",
  category_order: 1,
  category_title: "通常",
  title_order: 2,
  title: "フットケア 40分",
  charge: 6000,
  description: "（タコ、ウオノメ、角質除去・スクラブトリートメント・保湿ケア）",
  treatment_time: 40,
  course_number: 4,
  store_id: 1
)

Menu.create!(
  category: "Foot Care　~フットケア~",
  category_order: 1,
  category_title: "通常",
  title_order: 2,
  title: "スペシャルセット 60分",
  charge: 9000,
  description: "（ネイルケア＋フットケアのスペシャルセットケア）",
  treatment_time: 60,
  course_number: 5,
  store_id: 1
)

Menu.create!(
  category: "Foot Care　~フットケア~",
  category_order: 1,
  category_title: "巻き爪補正",
  title_order: 3,
  title: "取り付け",
  charge: 3000,
  description: "※ネイルケアまたはフットケアとセットでご予約ください。",
  treatment_time: 0,
  course_number: 6,
  store_id: 1
)

Menu.create!(
  category: "Body　Care　~ボディケア~",
  category_order: 2,
  category_title: "全身",
  title_order: 1,
  title: "全身　80分",
  charge: 8360,
  description: "※首や肩や腰など気になる部分を中心に揉みほぐします。",
  treatment_time: 80,
  course_number: 7,
  store_id: 1
)

Menu.create!(
  category: "Body　Care　~ボディケア~",
  category_order: 2,
  category_title: "全身",
  title_order: 1,
  title: "全身　50分",
  charge: 5170,
  description: "※首や肩や腰など気になる部分を中心に揉みほぐします。",
  treatment_time: 50,
  course_number: 8,
  store_id: 1
)

Menu.create!(
  category: "Body　Care　~ボディケア~",
  category_order: 2,
  category_title: "足ツボ",
  title_order: 2,
  title: "足ツボ　45分",
  charge: 4800,
  description: "※ふくらはぎや足裏の反射区をクリームを使ってしっかりと施術します。",
  treatment_time: 45,
  course_number: 9,
  store_id: 1
)

Menu.create!(
  category: "Body　Care　~ボディケア~",
  category_order: 2,
  category_title: "足ツボ",
  title_order: 2,
  title: "足ツボ　30分",
  charge: 3190,
  description: "※ひざから下をクリームを使って施術します。",
  treatment_time: 30,
  course_number: 10,
  store_id: 1
)

Menu.create!(
  category: "Topping　~トッピング~",
  category_order: 3,
  category_title: "全身",
  title_order: 1,
  title: "30分",
  charge: 3190,
  description: "※背中、肩など気になる部分を中心に圧してほぐします。",
  treatment_time: 30,
  course_number: 11,
  store_id: 1
)
