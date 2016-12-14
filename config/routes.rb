Rails.application.routes.draw do
  resources :mypicks
  resources :draftees
  resources :teams
  resources :picks


  devise_for :users
  root "picks#index"
end
