# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: { registrations: 'users/registrations' }
  namespace :api do
    namespace :v1 do 
      resources :users
    end
  end
end
