Rails.application.routes.draw do
  root to: 'homes#top'
  get 'relationships/create'
  get 'relationships/destroy'
  get "home/about" => "homes#about", as: "about"
  get "search" => "searches#search"

  devise_for :users, controllers: {
  registrations: "users/registrations"
  }

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
