Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  } 
  root 'items#index'
  resources :items, only: [:index, :new, :show] do
  #Ajaxで動くアクションのルートの作成
    collection do
      get 'get_children_category', defaults: { format: 'json' }
      get 'get_grandchildren_category', defaults: { format: 'json' }
    end
  end
  resources :users
end
