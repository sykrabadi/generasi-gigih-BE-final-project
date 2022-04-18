require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  it 'is valid with a order and food' do
    order = Order.create(
      order_date: Date.new(2022, 4, 16),
      total_price: 15_000,
      payment_status: 'new'
    )

    category = Category.create(name: 'Lunch')

    food = Food.create(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15_000.0,
      category: category
    )

    order_detail = OrderDetail.create(
      order_id: order.id,
      food_id: food.id,
      quantity: 1
    )

    expect(order_detail).to be_valid
  end

  it 'check if the quantity is integer' do
    order = Order.create(
      order_date: Date.new(2022, 4, 16),
      total_price: 15_000,
      payment_status: 'new'
    )

    category = Category.create(name: 'Lunch')

    food = Food.create(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15_000.0,
      category: category
    )

    order_detail = OrderDetail.create(
      order_id: order.id,
      food_id: food.id,
      quantity: '2s'
    )

    order_detail.valid?
    expect(order_detail.errors[:quantity]).to include('is not a number')
  end
end
