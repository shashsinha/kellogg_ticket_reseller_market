Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "tickets#index"
  resources :event_categories
  resources :auction_bids
  resources :bought_tickets
  resources :events
  resources :tickets
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
