require 'rails_helper'

RSpec.describe Category, type: :model do
  it "valid with name" do
    category = Category.new(
      name: "Beverage"
    )

    expect(category).to be_valid
  end

  it "invalid without name" do
    category = Category.new(
      name: nil
    )

    category.valid?

    expect(category.errors[:name]).to include ("can't be blank")
  end
end
