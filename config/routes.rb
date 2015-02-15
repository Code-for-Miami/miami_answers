Oaklandanswers::Application.routes.draw do
  devise_scope :user do

    # Sign In
      get 'sign_in', to: 'devise/sessions#new'
      post 'sign_in', to: 'devise/sessions#create'

    # Log Out
      get 'sign_out', to: 'devise/sessions#destroy'
      delete 'sign_out', to: 'devise/sessions#destroy'

    # Sign Up / Profile
      get 'sign_up', to: 'devise/registrations#new'
      post 'sign_up', to: 'devise/registrations#create'
      get 'sign_up/cancel', to: 'devise/registrations#cancel'
      get 'profile', to: 'devise/registrations#edit'
      patch 'profile', to: 'devise/registrations#update'
      put 'profile', to: 'devise/registrations#update'
      delete 'profile', to: 'devise/registrations#destroy'

    # Secret
      get 'secret', to: 'devise/passwords#new'
      post 'secret', to: 'devise/passwords#create'
      get 'secret/edit', to: 'devise/passwords#edit'
      patch 'secret/edit', to: 'devise/passwords#edit'
      put 'secret/edit', to: 'devise/passwords#edit'

  end

  devise_for :users

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  get "category/index"
  post "search/reindex_articles", to: "search#reindex_articles"

  resources :articles

  resources :categories
  root to: "home#index"

  get '/about', to: "home#about" , as: :about
  match '/search/', to: "search#index" , as: :search, via: [:get, :post]

  post 'persona/login' => 'persona#login'
  post 'persona/logout' => 'persona#logout'
end