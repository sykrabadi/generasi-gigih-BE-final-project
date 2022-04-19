require 'rails_helper'

RSpec.describe Order, type: :model do
  it "is valid with given order date" do
    order = Order.new(
      order_date: Date.new(2022, 4, 16),
      total_price: 15000,
      payment_status: "paid"
    )

    expect(order).to be_valid
  end

  it "is invalid without given order date" do
    order = Order.new(
      order_date: nil,
      total_price: nil,
      payment_status: "paid"
    )

    order.valid?
    expect(order.errors[:order_date]).to include("can't be blank")
  end

  it 'check order has valid total price' do
    category = Category.create(name: 'Lunch')
    
    food = Food.create(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0,
      category: category
    )

    order_1 = Order.create(
      order_date: Date.new(2022, 4, 16),
      total_price: 0,
      payment_status: 'new'
    )

    order_detail_1 = OrderDetail.create(
      order_id: order_1.id,
      food_id: food.id,
      quantity: 2,
      price: food.price
    )

    order_detail_2 = OrderDetail.create(
      order_id: order_1.id,
      food_id: food.id,
      quantity: 2,
      price: food.price
    )

    order_2 = Order.create(
      order_date: Date.new(2022, 4, 16),
      total_price: 0,
      payment_status: 'new'
    )

    order_detail_3 = OrderDetail.create(
      order_id: order_2.id,
      food_id: food.id,
      quantity: 3,
      price: food.price
    )

    order_detail_4 = OrderDetail.create(
      order_id: order_2.id,
      food_id: food.id,
      quantity: 3,
      price: food.price
    )

    order_1.update(total_price: OrderDetail.total_price(order_1))
    
    order_2[:total_price] = OrderDetail.total_price(order_2)

    order_2.save
    expect(order_1[:total_price]).to eq(60000)
    expect(order_2[:total_price]).to eq(90000)
  end

  it "is invalid without given total price" do
    order = Order.new(
      order_date: Date.new(2022, 4, 16),
      total_price: nil,
      payment_status: "paid"
    )

    order.valid?
    expect(order.errors[:total_price]).to include("can't be blank")
  end

  it "is invalid given total price value is not a number" do
    order = Order.new(
      order_date: Date.new(2022, 4, 16),
      total_price: "2020q",
      payment_status: "paid"
    )
    
    order.valid?
    expect(order.errors[:total_price]).to include("is not a number")
  end

  it "is invalid without given payment status" do
    order = Order.new(
      order_date: Date.new(2022, 4, 16),
      total_price: 20222,
      payment_status: nil
    )

    order.valid?
    expect(order.errors[:payment_status]).to include("can't be blank")
  end
end
