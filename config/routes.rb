RedditClone::Application.routes.draw do
  get "comments/create"

  get "comments/destroy"

  get "comments/update"

  get "comments/edit"

  resources :users
  resource :session
  resources :subs
  resources :links
end
