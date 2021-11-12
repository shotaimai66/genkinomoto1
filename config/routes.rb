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
  get 'users/index'
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

  devise_for :staffs, controllers: {
    sessions:      'staffs/sessions',
    passwords:     'staffs/passwords',
    registrations: 'staffs/registrations'
  }
  resources :staffs, only: %i[index]
  resources :reservations
  resources :stores
  resources :items do
    collection do
      get 'search'
    end
  end
  resource :carts, only: %i[show]
  resource :orders, only: %i[create destroy]
  resources :payments, only: %i[index show]
  post 'pay', to: 'payments#pay'
end
