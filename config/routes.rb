Rails.application.routes.draw do
  root 'static_pages#top'
  resources :menus do
    collection do
      get :treatment_menu
    end
  end
  resources :reservations do
    collection do
      get :confirm_reservation
      get :staff_new_reservation
      get :staff_create_reservation
    end
    member do
      get :edit_reserve
      post :update_reserve
    end
  end
  resources :stores
  get 'users/account', to: 'users#account' # users_account_path
  get 'users/index', to: 'users#index' # users_index_path
  get 'users/show', to: 'users#show' # users_show_path
  get 'users/admin_edit', to: 'users#admin_edit'
  patch 'users/admin_update', to: 'users#admin_update'
  delete 'users/admin_destroy', to: 'users#admin_destroy'
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
  get 'staffs/account', to: 'staffs#account' # staffs_account_path
  get 'staffs/index', to: 'staffs#index' # staffs_index_path
  get 'staffs/show', to: 'staffs#show' # staffs_show_path
  get 'staffs/admin_edit', to: 'staffs#admin_edit'
  patch 'staffs/admin_update', to: 'staffs#admin_update'
  delete 'staffs/admin_destroy', to: 'staffs#admin_destroy'
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
  resources :notifications
end
