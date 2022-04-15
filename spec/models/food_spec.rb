require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with a name and a description' do
    category = Category.new(name: "Lunch")
    food = Food.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0,
      category: category
    )

    expect(food).to be_valid
  end

  it 'is invalid without a name' do
    category = Category.new(name: "Lunch")
    food = Food.create(
      name: nil,
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0,
      category: category
    )

    food.valid?

    expect(food.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    category = Category.new(name: "Lunch")
    food1 = Food.create(
      name: "Nasi Uduk",
      description: "Betawi style steamed rice cooked in coconut milk. Delicious!",
      price: 10000.0,
      category: category
    )
    
    food2 = Food.create(
      name: "Nasi Uduk",
      description: "Just with a different description.",
      price: 10000.0,
      category: category
    )

    food2.valid?
    
    expect(food2.errors[:name]).to include("has already been taken")
  end

  it "should check if the price is greater than 0.01" do
    category = Category.new(name: "Lunch")
    food = Food.create(
      name: "Nasi Uduk",
      description: "Betawi style steamed rice cooked in coconut milk. Delicious!",
      price: 0.0001,
      category: category
    )

    food.valid?
    expect(food.errors[:price]).to include ("must be greater than 0.01")
  end

  it "should check if the price only accept numeric" do
    category = Category.new(name: "Lunch")
    food = Food.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: "2000s",
      category: category
    )

    food.valid?
    expect(food.errors[:price]).to include("is not a number")
  end
end