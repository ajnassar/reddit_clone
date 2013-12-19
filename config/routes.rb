RedditClone::Application.routes.draw do
  resources :users
  resource :session
  resources :subs do
    resources :links
  end
end
