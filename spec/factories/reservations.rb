FactoryBot.define do
  factory :reservation do
    start_time { Time.current }
    end_time { Time.current + 360 }
    course { 10 }
    guest_id { "1" }
    comment { "sample" }
    store_id { "1" }
  end
end
