Rails.application.routes.draw do
  root 'static_pages#top'
  resources :reservations do
    collection do
      get :confirm_reservation
    end
    member do
      get :edit_reserve
      post :update_reserve
    end
  end
  resources :stores
  get 'users/account', to: 'users#account'
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    omniauth_callbacks: "omniauth_callbacks"
  }
  scope modules: :users do
    resource :users,only: [:edit, :update, :show] do
      collection do
        get 'quit' # 退会画面
        patch 'out' # flagを更新し、会員からはログインできなくする
      end
    end
  end
  get 'staffs/account', to: 'staffs#account'
  devise_for :staffs, controllers: {
    sessions:      'staffs/sessions',
    passwords:     'staffs/passwords',
    registrations: 'staffs/registrations'
  }
  resources :reservations
  resources :stores
  resources :items do
    collection do
      get 'search'
    end
  end
  resources :events do
    collection do
      get 'search'
    end
  end
  resource :carts, only: %i[show]
  post 'create_item_order', to: 'orders#create_item_order'
  delete 'destroy_item_order', to: 'orders#destroy_item_order'
  post 'create_event_order', to: 'event_orders#create_event_order'
  delete 'destroy_event_order', to: 'event_orders#destroy_event_order'
  resources :payments, only: %i[index show]
  post 'pay', to: 'payments#pay'
end
