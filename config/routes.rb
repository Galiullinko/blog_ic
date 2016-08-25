Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users, controllers: { registrations: "users/registrations" }

  namespace :users do
    resources :posts, only: %i(new create edit update destroy) do
      resources :comments, only: %i(create destroy)
    end
  end

  resources :posts, only: %i(show index)

  get "/users/:user_id/posts/", to: "user_posts#index"

  root to: "posts#index"
end
