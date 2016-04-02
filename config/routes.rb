Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :omniauth_callbacks => 'users/omniauth_callbacks'
  }

  root to: 'top#index'
  get '/parent' => 'top#parent'
  get '/student_user' => 'top#student_user'
  get '/support' => 'top#supporter'
  get '/about' => 'top#about'
  get '/corporate' => 'top#corporate'
  get '/privacy' => 'top#privacy'
  get '/terms' => 'top#terms'
  get '/legal' => 'top#legal'
  get '/contact' => 'top#contact'
  get '/counselor' => 'top#counselor'

  resources :users do
    collection do
      get 'register'
      post 'confirm_register'
      post 'add_info'
      post 'update_add_info'
      post 'report'
      post 'reported'
      get 'account'
      post 'confirm_account'
      post 'save_account'
      get 'search_bank'
      get 'select_bank'
      get 'search_store'
      get 'select_store'
      get 'reset_account'
    end
  end

  resources :tickets do
    collection do
      post 'purchase'
    end
  end

  resources :supporters do
    collection do
      get 'search'
    end
  end
  
  resources :counselors do
    collection do
      get 'search'
    end
  end

  resources :students do
    collection do
      get 'search'
    end
  end

  resources :diaries do
    collection do
      post 'search'
    end
  end

  namespace :managers do
    get :index
    resources :users do
      collection do
        get 'search'
      end
    end
    resources :messages do
      collection do
        get 'search'
      end
    end
    resources :events do
      collection do
        get 'search'
      end
    end
    resources :reports do
      collection do
        get 'search'
      end
    end
    get :account
  end

  resources :offers
  resources :events, only: [:index,:show]
  resources :messages, except: [:edit, :update]
  resources :accounts, except: [:index, :show]
  resources :payments, only: [:index, :new, :create]
  resources :participants, only: [:create, :update, :destroy]
  resources :reviews, only: [:create, :update, :destroy]
  resources :comments, only: [:create, :update, :destroy]
end
