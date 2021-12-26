Rails.application.routes.draw do
  root to: "home#top"

  resources :histroys

  get "/rooms/index/:address" => "rooms#index"
  get "/rooms/posts" => "rooms#posts"
  get "/rooms/show/:id" => "rooms#show"

  resources :rooms

  get "/users/edit" => "users#edit"
  get "/users/login_form" => "users#login_form"
  post "/users/login" => "users#login"
  post "/users/logout" => "users#logout"
  post "/users/update" => "users#update"

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
