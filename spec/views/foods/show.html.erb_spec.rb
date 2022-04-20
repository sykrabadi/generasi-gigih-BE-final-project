require 'rails_helper'

RSpec.describe "foods/show", type: :view do
  before(:each) do
    @food = assign(:food, Food.create!(
      name: "Name",
      price: 2.5,
      description: "MyText",
      category: "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Category/)
  end
end
