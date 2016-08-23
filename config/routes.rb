Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users, controllers: { registrations: "users/registrations" }

  namespace :users do
    resources :posts, only: %i(new create edit update destroy) do
      resources :comments, only: %i(create)
    end
  end

  resources :posts, only: %i(show index)

  root to: "posts#index"
end
