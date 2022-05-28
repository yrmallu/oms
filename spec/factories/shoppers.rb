FactoryBot.define do
  factory :shopper, class: 'Shopper' do
    name { Faker::Company.name }
    email { Faker::Internet.email }
    nif { Faker::Alphanumeric.alpha }
  end
end
