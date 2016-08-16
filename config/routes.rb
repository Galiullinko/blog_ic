Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :posts, only: %i(update destroy index show)
  resources :comments, only: %i(update destroy)

  resources :posts do
    resources :comments, shallow: true
  end

  root to: "pages#home"
end
