Rails.application.routes.draw do
  post 'api/v1/login', to: 'user_token#create' #login
  
  namespace :api do
    namespace :v1 do
      get 'auth', to: 'home#auth' #user home
      get 'auth_admin', to: 'home#auth_admin' #admin home
      get 'users', to: 'users#index' #show all user
      post 'register', to: 'users#create' #register
      get 'user/current', to: 'users#current' #show
      put 'user/:id', to: 'users#update' #edit
      delete 'user/:id', to: 'users#destroy' #delete user
      post 'password/token', to: 'forget_password#forgot' #forget password
      post 'password/reset', to: 'forget_password#password_reset' #reset password
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
