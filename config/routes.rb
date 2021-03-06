# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  resources :routines
  # Search
  get :autocomplete, controller: :search
  get :search, controller: :search

  resources :brands, model_name: "Brand" do
    member do
      put "like", to: "brands#like"
      put "follow", to: "brands#follow"
    end
  end # Brand

  resources :posts, except: [:update] do
    member do
      put "like", to: "posts#like"
    end
    resources :comments, only: [:create, :destroy], module: :posts
  end

  resources :guides do
    resources :comments, only: [:create, :destroy], module: :guides
  end

  resources :comments, only: [:create, :destroy] do
    member do
      put "like", to: "comments#like"
    end
  end

  resources :catalogs, model_name: "Catalog" do
    member do
      put "like", to: "catalogs#like"
      put "favorite", to: "catalogs#favorite"
      put "add_item", to: "catalogs#add_item"
      delete "remove_item", to: "catalogs#remove_item"
    end
  end

  resources :outfits, model_name: "Outfit" do
    member do
      put "like", to: "outfits#like"
      put "favorite", to: "outfits#favorite"
      put "add_item", to: "outfits#add_item"
      delete "remove_item", to: "outfits#remove_item"
    end
  end

  ### Begin: Products ###

  resources :products, model_name: "Product" do
    member do
      put "like", to: "products#like"
      put "favorite", to: "products#favorite"
      put "collect", to: "products#collect"
      put "outfit", to: "products#outfit"
    end

    resources :reviews do
      member do
        put "like", to: "reviews#like"
      end

      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end
=begin
  resources :accessories, model_name: "Accessory" do
    member do
      put "like", to: "accessories#like"
      put "favorite", to: "accessories#favorite"
      put "collect", to: "accessories#collect"
      put "outfit", to: "accessories#outfit"
    end

    resources :reviews do
      member do
        put "like", to: "reviews#like"
      end

      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end # Accessory

  resources :bottoms, model_name: "Bottom" do
    member do
      put "like", to: "bottoms#like"
      put "favorite", to: "bottoms#favorite"
      put "collect", to: "bottoms#collect"
    end

    resources :reviews do
      member do
        put "like", to: "reviews#like"
      end

      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end # Bottom

  resources :cosmetics, model_name: "Cosmetic" do
    member do
      put "like", to: "cosmetics#like"
      put "favorite", to: "cosmetics#favorite"
      put "collect", to: "cosmetics#collect"
    end

    resources :reviews do
      member do
        put "like", to: "reviews#like"
      end

      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end # Cosmetic

  resources :dresses, model_name: "Dress" do
    member do
      put "like", to: "dresses#like"
      put "favorite", to: "dresses#favorite"
      put "collect", to: "dresses#collect"
    end

    resources :reviews do
      member do
        put "like", to: "reviews#like"
      end

      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end # Dress

  resources :fragrances, model_name: "Fragrance" do
    member do
      put "like", to: "fragrances#like"
      put "favorite", to: "fragrances#favorite"
      put "collect", to: "fragrances#collect"
    end

    resources :reviews do
      member do
        put "like", to: "reviews#like"
      end

      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end # Fragrance

  resources :jewelries, model_name: "Jewelry" do
    member do
      put "like", to: "jewelries#like"
      put "favorite", to: "jewelries#favorite"
      put "collect", to: "jewelries#collect"
    end

    resources :reviews do
      member do
        put "like", to: "reviews#like"
      end

      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end # Jewelry

  resources :shoes, model_name: "Shoe" do
    member do
      put "like", to: "shoes#like"
      put "favorite", to: "shoes#favorite"
      put "collect", to: "shoes#collect"
    end

    resources :reviews do
      member do
        put "like", to: "reviews#like"
      end

      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end # Shoe

  resources :suits, model_name: "Suits" do
    member do
      put "like", to: "suits#like"
      put "favorite", to: "suits#favorite"
      put "collect", to: "suits#collect"
    end

    resources :reviews do
      member do
        put "like", to: "reviews#like"
      end

      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end # Shoe

  resources :tops, model_name: "Top" do
    member do
      put "like", to: "tops#like"
      put "favorite", to: "tops#favorite"
      put "collect", to: "tops#collect"
    end

    resources :reviews do
      member do
        put "like", to: "reviews#like"
      end

      resources :comments, only: [:create, :destroy], module: :reviews
    end
  end # Top
=end
  ### End: Products ###


  # Jumpstart views
  if Rails.env.development? || Rails.env.test?
    mount Jumpstart::Engine, at: "/jumpstart"
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # Administrate
  authenticated :user, lambda { |u| u.admin? } do
    ### SHOULD BE UNDER namespace :admin do (below)
    ### Begin: App Specific ###
    resources :body_part_groups
    resources :body_part
    resources :category_groups
    resources :categories
    resources :subcategories
    ### End: App Specific ###


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
  resources :profiles, :only => [:index, :show, :edit, :update] do
    member do
      put "follow", to: "user_profiles#follow"
      # put "watch", to: "user_profiles#watch"
    end
    resources :collections, :only => [:index, :show, :destroy]
    resources :outfits, only: [:index, :show]
    # resources :collections do
    #   resources :comments, only: [:create, :destroy], module: :collections
    # end
  end
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

  namespace :action_text do
    resources :embeds, only: [:create], constraints: {id: /[^\/]+/} do
      collection do
        get :patterns
      end
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
