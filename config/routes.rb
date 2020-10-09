Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  } 
  devise_scope :user do
    get  'residencies', to: 'users/registrations#new_residency'
    post 'residencies', to: 'users/registrations#create_residency'
  end
  resources :items do
  #Ajaxで動くアクションのルートの作成
    collection do
      get 'get_children_category', defaults: { format: 'json' }
      get 'get_grandchildren_category', defaults: { format: 'json' }
    end
    member do
      get 'buy'
      post 'pay'
    end
  end

  resources :users
  resources :images
  resources :cards, only: [:new, :create, :index, :destroy, :show]
end
