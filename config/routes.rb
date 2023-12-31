Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # # Add the route for "/groups"
  # resources :groups

  # Defines the root path route ("/")
  devise_for :users
  resources :groups, only: %i[index new create] do
    resources :entities, only: %i[index new create]
    post 'create', on: :member
  end

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end
  unauthenticated :user do
    root 'groups#login_page', as: :unauthenticated_root
  end
end
