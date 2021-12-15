FactoryBot.define do
  factory :user do
    name { "name" }
    email { "sample@email.com" }
    password { "password" }
    password_confirmation { "password" }
    phone { "090-0000-0000" }
    store_id { 1 }
  end
end
