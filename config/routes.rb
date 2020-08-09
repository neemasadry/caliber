# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  # resources :collections do
  #   resources :comments, only: [:create, :destroy], module: :collections
  # end

  resources :posts do
    resources :comments, only: [:create, :destroy], module: :posts
  end

  ### PRODUCTS ###
  resources :accessories, model_name: "Accessory" do
    resources :reviews do
      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end

  resources :bottoms, model_name: "Bottom" do
    resources :reviews do
      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end

  resources :cosmetics, model_name: "Cosmetic" do
    resources :reviews do
      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end

  resources :dresses, model_name: "Dress" do
    resources :reviews do
      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end

  resources :fragrances, model_name: "Fragrance" do
    resources :reviews do
      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end

  resources :jewelries, model_name: "Jewelry" do
    resources :reviews do
      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end

  resources :shoes, model_name: "Shoe" do
    resources :reviews do
      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end

  resources :tops, model_name: "Top" do
    resources :reviews do
      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end

  resources :guides do
    resources :comments, only: [:create, :destroy], module: :guides
  end

  resources :brands

  # Jumpstart views
  if Rails.env.development? || Rails.env.test?
    mount Jumpstart::Engine, at: "/jumpstart"
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # Administrate
  authenticated :user, lambda { |u| u.admin? } do
    namespace :admin do
      if defined?(Sidekiq)
        require "sidekiq/web"
        mount Sidekiq::Web => "/sidekiq"
      end

      resources :announcements
      resources :users
      namespace :user do
        resources :connected_accounts
      end
      resources :accounts
      resources :account_users
      resources :plans
      namespace :pay do
        resources :charges
        resources :subscriptions
      end

      root to: "dashboard#show"
    end
  end

  # API routes
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resource :auth
      resource :me, controller: :me
      resources :accounts
      resources :users
    end
  end

  # User account
  devise_for :users,
    controllers: {
      masquerades: "jumpstart/masquerades",
      omniauth_callbacks: "users/omniauth_callbacks",
      registrations: "users/registrations"
    }

  # scope module: 'user_profiles', path: 'users'
  resources :user_profiles, :only => [:index, :show]
    # member do
    #   put "follow", to: "user_profiles#follow"
    #   put "watch", to: "user_profiles#watch"
    # end

    # resources :notifications do
    #   collection do
    #     post :mark_as_read
    #     post :mark_all_as_read
    #   end
    # end
  # end

  resources :announcements, only: [:index]
  resources :api_tokens
  resources :accounts do
    member do
      patch :switch
    end

    resources :account_users, path: :members
    resources :account_invitations, path: :invitations, module: :accounts
  end
  resources :account_invitations

  # Payments
  resource :card
  resource :subscription do
    patch :info
    patch :resume
  end
  resources :charges
  namespace :account do
    resource :password
  end

  namespace :users do
    resources :mentions, only: [:index]
  end
  namespace :user, module: :users do
    resources :connected_accounts
  end

  resources :embeds, only: [:create], constraints: {id: /[^\/]+/} do
    collection do
      get :patterns
    end
  end

  scope controller: :static do
    get :about
    get :terms
    get :privacy
    get :pricing
  end

  match "/404", via: :all, to: "errors#not_found"
  match "/500", via: :all, to: "errors#internal_server_error"

  authenticated :user do
    root to: "dashboard#show", as: :user_root
  end

  # Public marketing homepage
  root to: "static#index"
end
