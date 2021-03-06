Rails.application.routes.draw do


  devise_for :users, controllers: { registrations: "registrations" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  require "sidekiq/web"
  authenticate :admin_user do
    mount Sidekiq::Web => '/sidekiq'
  end

  scope '(:locale)', locale: /fr|en/ do
    root to: 'pages#home'
    post '/contact', to: 'pages#contact'
    get '/pages', to: 'pages#create'

    namespace :account do
      resource :dashboard, only: :show, controller: 'dashboard' do
        resource :users, only: [:edit, :update]
      end
    end

    namespace :group, module: 'groups' do
      scope ':group' do
        root to: 'home#show'

        resources :activities do
          resources :bookings,  only: [:new, :create, :edit, :update, :destroy]
          resources :comments,  only: [:create]
          resources :locations, only: [:new, :create], module: 'activities'
        end

        resources :newsfeeds, only: [:new, :create] do
          member do
            put "like" => "newsfeeds#upvote"
            put "unlike" => "newsfeeds#downvote"
          end
        end
        resources :users,     only: [:show, :index] do
          collection do
            get :autocomplete
          end
        end

        resources :locations,         only: [:new, :create, :edit, :update, :destroy]
        resources :location_reviews,  only: [:create]
      end
    end
  end
end

