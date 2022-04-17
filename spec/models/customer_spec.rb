require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "should accept the valid name and email" do
    customer = Customer.new(
      name: "Si Gigih",
      email: "sigigih@email.com"
    )

    expect(customer).to be_valid
  end

  it "should not accept the invalid name" do
    customer = Customer.new(
      name: nil,
      email: "sigigih@email.com"
    )

    customer.valid?

    expect(customer.errors[:name]).to include("can't be blank")
  end

  it "should not accept the invalid email" do
    customer = Customer.new(
      name: "si gigih",
      email: nil
    )

    customer.valid?

    expect(customer.errors[:email]).to include("can't be blank")
  end

  it "should not accept the duplicated email" do
    customer1 = Customer.create(
      name: "Si Gigih",
      email: "sigigih@email.com"
    )

    customer2 = Customer.create(
      name: "Si Gigih",
      email: "sigigih@email.com"
    )

    customer2.valid?
    expect(customer2.errors[:email]).to include("has already been taken")
  end

  it "check if a customer place an order" do
    customer = Customer.create(
      name: "Si Gigih",
      email: "sigigih@email.com"
    )

    order = Order.new(
      order_date: Date.new(2022, 4, 16),
      total_price: 2020,
      payment_status: "paid"
    )

    expect(Customer.check_order(customer.id)).to be_valid
  end
end
