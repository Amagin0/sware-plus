FactoryBot.define do
  factory :customer_tanaka do
    name                  {"田中 太郎"}
    password              {"taro.tanaka"}
    password_confirmation {"taro.tanaka"}
    sequence(:email) {Faker::Internet.email}
  end
end