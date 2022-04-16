FactoryBot.define do
  factory :order do
    order_date { "2022-04-16 01:54:58" }
    total_price { 1.5 }
    payment_status { "MyString" }
  end
end
