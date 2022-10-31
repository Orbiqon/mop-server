# frozen_string_literal: true

require('sidekiq/web')

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'store_currencies/index'
    end
  end
  default_url_options host: ENV['ASSET_PATH']

  # Sidekiq Routes
  mount Sidekiq::Web => '/sidekiq'

  # Swagger Routes
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # Admin Devise Routes
  devise_for :admins, controllers: {
    registrations: 'app/admins/registrations',
    passwords: 'app/admins/passwords',
    confirmations: 'app/admins/confirmations'
  }

  devise_scope :admin do
    authenticated :admin do
      root 'app/dashboards#show', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # APP Routes
  scope module: :app, path: 'app' do
    resource :dashboard, only: [:show]
    resources :styles
    resources :colours
    resources :exhibition_styles
    resources :tax_rates
    resources :faqs
    resources :packages
  end

  # API Routes
  scope '/api' do
    scope '/v1' do
      use_doorkeeper do
        controllers tokens: 'api/v1/tokens'
      end
    end
  end

  scope module: :api, path: 'api' do
    scope module: :v1, path: 'v1' do
      devise_for :users, controllers: {
        registrations: 'api/v1/users/registrations',
        passwords: 'api/v1/users/passwords',
        confirmations: 'api/v1/users/confirmations'
      }, scoped_views: 'api/v1/users'

      scope module: :items, path: 'items' do
        resources :galleries, only: %i[index show]
        resources :exhibitions do
          collection do
            get :by_key
          end
        end
        resources :artworks do
          collection do
            get :featured
            get :get_paper_and_price
          end
        end
        resources :artists do
          collection do
            get :search_artist
          end
        end
        resources :styles, only: %i[index]
        resources :colours, only: %i[index]
        resources :insights, only: %i[create]
        resources :packages do
          collection do
            get :trial
          end
        end
        resources :faqs
      end

      resource :profile, only: %i[show update]
      resource :gallery, only: %i[show update]
      resources :artworks
      resources :colours, only: [:index]
      resources :styles, only: [:index]
      resources :exhibitions
      resources :exhibition_styles, only: [:index]
      resources :coupons
      resources :packages do
        collection do
          get :trial
        end
      end
      resources :subscriptions
      resources :orders
      resources :artist_settings
      resources :tax_rates
      resources :price_sheets do 
        collection do
          get :get_pricing_data
        end
      end
      resources :store_currencies, only: %i[index]
    end
  end
  # root to: 'home#index'
end
