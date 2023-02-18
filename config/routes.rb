Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "pages#home"
  resources :companies
  resources :projects do
    get 'newstudy', on: :collection, action: 'newstudy'
    get 'newsingle', on: :collection, action: 'newsingle'
    get 'newmulti', on: :collection, action: 'newmulti'
    get 'newleadgen', on: :collection, action: 'newleadgen'
  end

  get "client", to: "pages#dashboardclient"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
