Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  mount Commontator::Engine => '/commontator'

  devise_for :users

  resources :users
  resources :quickies, except: [ :index ] do
    put "up", to: :up, on: :member
    put "down", to: :down, on: :member
    get "vote_by_tweet", to: :vote_by_tweet, on: :member
  end

  root to: 'home#index'
end
