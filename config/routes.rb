Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :tickets, only: [:create, :destory, :delete]
  end
  resources :users, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end
