FactoryBot.define do
  factory :merchant, class: 'Merchant' do
    name { Faker::Company.name }
    email { Faker::Internet.email }
    cif { Faker::Alphanumeric.alpha }
  end
end
