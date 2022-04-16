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

  it "is valid with given total price" do
    order = Order.new(
      order_date: Date.new(2022, 4, 16),
      total_price: 15000,
      payment_status: "paid"
    )

    expect(order).to be_valid
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