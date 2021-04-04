Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        member do 
          get :confirm_email, to: 'authentication#confirm'
        end
      end
      put 'password/update', to: 'passwords#update'
      post 'password/forgot/', to: 'passwords#forgot', constraints: { email: /.*/ }
      post 'password/reset/', to: 'passwords#reset'
      post '/auth/login', to: 'authentication#login'
    end
  end
 
  # get '/*a', to: 'application#not_found'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
