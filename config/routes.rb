Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :posts do
    resources :comments, shallow: true
  end

  root to: "pages#home"
end
