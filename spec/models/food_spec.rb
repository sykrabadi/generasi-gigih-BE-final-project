require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with a name and a description' do
    food = Food.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0,
      category: "lunch"
    )

    expect(food).to be_valid
  end

  it 'is invalid without a name' do
    food = Food.create(
      name: nil,
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0,
      category: "lunch"
    )

    food.valid?

    expect(food.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    food1 = Food.create(
      name: "Nasi Uduk",
      description: "Betawi style steamed rice cooked in coconut milk. Delicious!",
      price: 10000.0,
      category: "lunch"
    )
    
    food2 = Food.create(
      name: "Nasi Uduk",
      description: "Just with a different description.",
      price: 10000.0,
      category: "lunch"
    )

    food2.valid?
    
    expect(food2.errors[:name]).to include("has already been taken")
  end

  it "should check if the price is greater than 0.01" do
    food = Food.create(
      name: "Nasi Uduk",
      description: "Betawi style steamed rice cooked in coconut milk. Delicious!",
      price: 0.0001,
      category: "lunch"
    )

    food.valid?
    expect(food.errors[:price]).to include ("must be greater than 0.01")
  end

  it "should check if the price only accept numeric" do
    food = Food.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: "2000s",
      category: "lunch"
    )

    food.valid?
    expect(food.errors[:price]).to include("is not a number")
  end

  it "should check if description is not more than 150 characters casted to array" do
    food = Food.new(
      name: 'Nasi Uduk',
      description: 'Nasi uduk biasa dihidangkan dengan emping goreng, tahu goreng, telur dadar atau telur goreng yang teriris, abon kering, tempe, bawang goreng, ayam goreng, timun serta sambal kacang. Hidangan ini biasanya lebih sering dijual di pagi hari untuk sarapan dan malam hari untuk makan malam. Pada malam hari, nasi uduk sering kali dijual di pinggir jalan raya di kota-kota besar. Nasi uduk banyak dijual di kota-kota dan wilayah di pulau Jawa, tetapi cukup sulit untuk ditemukan di luar Jawa',
      price: 20000,
      category: "Lunch"
    )

    food.valid?
    expect(food.errors[:description]).to include("is too long (maximum is 150 characters)")
  end
end