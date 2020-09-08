Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'new_user_registration', to: 'users/registrations#new'
    post 'user_registration', to: 'users/registrations#create'
  end
  resources :users, only: [:new, :create]
  root 'items#index'
<<<<<<< Updated upstream
  resources :items, only: [:index, :new, :show]
  resources :users, only: [:new, :show, :index, :edit]
=======
>>>>>>> Stashed changes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
