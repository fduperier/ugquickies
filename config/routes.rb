Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  devise_for :users

  resources :users
  resources :quickies, except: [ :index ] do
    put "up", to: :up, on: :member
    put "down", to: :down, on: :member
  end

  root to: 'home#index'
end
