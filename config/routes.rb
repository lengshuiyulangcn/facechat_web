Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'welcome#home'
  resources :after_signup
  use_doorkeeper do
     controllers :applications => 'oauth/applications'
  end
  namespace :api do
    namespace :v1 do
      get '/me' => 'users#me'
    end 
  end
end
