json.extract! food, :id, :name, :price, :description, :category, :created_at, :updated_at
json.url food_url(food, format: :json)
