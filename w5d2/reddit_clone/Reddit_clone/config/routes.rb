Rails.application.routes.draw do
  resources :user, only: [:new, :create]
  resources :session, only: [:new, :create, :destroy]
  resources :posts, except: [:destroy, :index] do
    resources :comments, only: [:new]
  end
  # resources :

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
