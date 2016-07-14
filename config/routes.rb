Rails.application.routes.draw do
  root 'welcome#home'
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :after_signup
  use_doorkeeper do
     controllers :applications => 'oauth/applications'
  end
end
