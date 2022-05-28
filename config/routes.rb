Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :disbursements, only: %i[index]

  mount Sidekiq::Web => '/sidekiq'

end
