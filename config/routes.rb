Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  } 
  devise_scope :user do
    get  'residencies', to: 'users/registrations#new_residency'
    post 'residencies', to: 'users/registrations#create_residency'
  end
  resources :items, only: [:index, :new, :show] do
  #Ajaxで動くアクションのルートの作成
    collection do
      get 'get_children_category', defaults: { format: 'json' }
      get 'get_grandchildren_category', defaults: { format: 'json' }
    end
  end
  resources :users do
    member do
      get 'paymethod'
      get 'newcredit'
    end
  end
end
