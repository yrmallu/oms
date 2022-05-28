FactoryBot.define do
  factory :order, class: 'Order' do
    amount { 30 }
    merchant factory: :merchant
    shopper factory: :shopper

    trait :completed do
      status { 'completed' }
      completed_at { Time.zone.now }
    end

    trait :disbursed do
      disbursed_amount { 29.7 }
      fee { 0.3 }
      status { 'disbursed' }
      disbursed_at { Time.zone.now }      
    end
  end
end
