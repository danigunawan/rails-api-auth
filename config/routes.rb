Rails.application.routes.draw do
  post 'user_token', to: 'user_token#create'
  
  namespace :api do
    namespace :v1 do
      get 'auth', to: 'home#auth'
      get 'auth_admin', to: 'home#auth_admin'
      get 'users', to: 'users#index'
      post 'users', to: 'users#create'
      get 'user/current', to: 'users#current'
      patch 'user/:id', to: 'users#update'
      delete 'user/:id', to: 'users#destroy'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
