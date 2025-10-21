Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "posts/index"
      get "posts/show"
      get "posts/create"
      get "posts/update"
      get "posts/destroy"
    end
  end
  root "home#index"

  resources :users
  resources :posts
  resources :comments

  namespace :api do
    namespace :v1 do
      resources :posts
    end
  end
end
