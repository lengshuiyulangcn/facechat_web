Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'welcome#home'
  resources :after_signup
  use_doorkeeper do
     controllers :applications => 'oauth/applications'
  end
end
