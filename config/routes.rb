Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :books, only: [:index, :create, :show, :edit, :destroy]
end
