Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users 
      post '/auth/login', to: 'authentication#login'
    end
  end
 
  get '/*a', to: 'application#not_found'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
