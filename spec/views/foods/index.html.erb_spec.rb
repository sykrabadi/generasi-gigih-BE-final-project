require 'rails_helper'

RSpec.describe "foods/index", type: :view do
  before(:each) do
    assign(:foods, [
      Food.create!(
        name: "Name",
        price: 2.5,
        description: "MyText",
        category: "Category"
      ),
      Food.create!(
        name: "Name",
        price: 2.5,
        description: "MyText",
        category: "Category"
      )
    ])
  end

  it "renders a list of foods" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Category".to_s, count: 2
  end
end
