require 'rails_helper'

RSpec.describe "foods/edit", type: :view do
  before(:each) do
    @food = assign(:food, Food.create!(
      name: "MyString",
      price: 1.5,
      description: "MyText",
      category: "MyString"
    ))
  end

  it "renders the edit food form" do
    render

    assert_select "form[action=?][method=?]", food_path(@food), "post" do

      assert_select "input[name=?]", "food[name]"

      assert_select "input[name=?]", "food[price]"

      assert_select "textarea[name=?]", "food[description]"

      assert_select "input[name=?]", "food[category]"
    end
  end
end
