Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :posts, only: %i(show index) do
    resources :comments, only: %i(show index)
  end

  namespace :users do
    resources :posts, only: %i(new create show edit update destroy), shallow: true do
      resources :comments, only: %i(new show index create destroy)
    end
  end

  root to: "posts#index"
end
