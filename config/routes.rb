Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :show] do
  #Ajaxで動くアクションのルートの作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :users, only: [:new, :show, :index, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
