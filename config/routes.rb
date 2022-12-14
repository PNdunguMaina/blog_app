Rails.application.routes.draw do
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "users#index"

  # route to create new post
  get '/posts/new', to: 'posts#new'

  # route to add created post
  post '/posts/new', to: 'posts#create_post', as: 'create_post'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  # route to create comment
  post 'users/:user_id/posts/:id/', to: 'posts#create_comment', as: 'create_comment'

  # route to post like
  post '/users/:user_id/posts/:id/like', to: 'posts#add_like', as: 'likes'
  
end

