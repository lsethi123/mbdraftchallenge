Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :mypicks
  resources :draftees
  resources :teams
  resources :picks
  resources :actuals
  resources :seconds

  # get 'landing', to: 'static#landing'
  root 'static#landing'

  get '/picks', :to => "picks#index"

  devise_for :users

end
