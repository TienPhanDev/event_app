Rails.application.routes.draw do
  namespace :api do
    resources :users
    resources :events
    resources :tickets
    resources :categories
    resources :event_categories
    resources :reviews
    get "users/find_user/:username", to: "users#find_user", as: "find_user"
    delete "users/delete_bookmark/:id", to: "users#delete_bookmark", as: "user_delete_bookmark"
  end

  namespace :api do
    resources :bookmarks
  end
end
