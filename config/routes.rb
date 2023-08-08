Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }, 
  path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  get 'home/index', as: "inicio"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/products", to: "products#index", as: "products"
  post "/products", to: "products#create"
  get "/products/new", to: "products#new", as: "new_product"
  get "/products/technology", to: "products#technology", as: "technology"
  get "/products/house", to: "products#house", as: "house"
  get "/products/footwear", to: "products#footwear", as: "footwear"
  get "/products/fashion", to: "products#fashion", as: "fashion"
  get "/products/:id/edit", to: "products#edit", as: "edit_product"
  get "/products/:id", to: "products#show", as: "product"
  patch "/products/:id", to: "products#update"
  put "/products/:id", to: "products#update"
  delete "/products/:id", to: "products#destroy"

  get "/:user_id/:product_id/requests", to: "requests#index", as: "requests"
  post "/:user_id/:product_id/requests", to: "requests#create", as: "create_request"
  get "/:user_id/:product_id/requests/new", to: "requests#new", as: "new_request"
  get "/:user_id/requests/:id/edit", to: "requests#edit", as: "edit_request"
  get "/:user_id/requests/:id", to: "requests#show", as: "request"
  patch "/:user_id/requests/:id", to: "requests#update"
  put "/:user_id/requests/:id", to: "requests#update", as: "update_request"
  delete "/:user_id/requests/:id", to: "requests#destroy"

  resources :user
  # Defines the root path route ("/")
  # root "articles#index"


  get "/reviews/:user_id/:product_id/reviews", to: "reviews#index", as: "reviews"
  get "/reviews/:user_id/:product_id/new", to: "reviews#new", as: "new_review"
  post "/reviews/:user_id/:product_id/reviews", to: "reviews#create"
  get "/reviews/:user_id/:product_id/:id_review", to: "reviews#show", as: "review"
  get "/reviews/:user_id/:product_id/:id_review/edit", to: "reviews#edit", as: "edit_review"
  patch "/reviews/:user_id/:product_id/:id_review", to: "reviews#update"
  put "/reviews/:user_id/:product_id/:id_review", to: "reviews#update"
  delete "/reviews/:user_id/:product_id/:id_review", to: "reviews#destroy"

  get "/chat_users/:user_id", to: "chats#index_user", as: "chat_users"
  get "/chat_admins/:admin_id", to: "chats#index_admin", as: "chat_admins"
  get "/chat_users/:user_id/:id_chat", to: "chats#show_user", as: "chat_user"
  get "/chat_admins/:admin_id/:id_chat", to: "chats#show_admin", as: "chat_admin"
  post "/chat_users/:user_id", to: "chats#create_user"
  post "/chat_admins/:admin_id", to: "chats#create_admin"
  get "/chat_users/:user_id/new", to: "chats#new_user", as: "new_chat_user"
  get "/chat_admins/:admin_id/new", to: "chats#new_admin", as: "new_chat_admin"
  delete "/chat/:id_chat", to: "chats#destroy", as: "destroy_chat"

  resources :wishlists, only: [:index, :create, :destroy, :show]


  root 'home#index'
  get 'home', to: 'home#index'

end
