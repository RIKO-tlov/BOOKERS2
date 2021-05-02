Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users
  root to: 'homes#top'
  get "home/about" => "homes#about", as: "about"

  resources :books, only: [:index, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :create, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
end
