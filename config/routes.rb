Rails.application.routes.draw do
  resources :customers do
    resources :orders do 
      :order_details
    end
  end
  resources :foods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
