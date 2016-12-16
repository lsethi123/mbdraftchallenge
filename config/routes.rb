Rails.application.routes.draw do
  resources :mypicks
  resources :draftees
  resources :teams
  resources :picks
  resources :actuals
  resources :seconds

  devise_for :users
  root "picks#index"
end
