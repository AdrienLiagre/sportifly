Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, controllers: { registrations: "registrations" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :account do
    resource :dashboard, only: :show, controller: 'dashboard' do
      resource :users, only: [:edit, :update]
    end
  end

  namespace :group, module: 'groups' do
    scope ':group' do
      root to: 'home#show'

      resources :activities do
        resources :bookings, only: [:new, :create, :destroy]
        resources :comments, only: [:create]
      end

      resources :newsfeeds, only: [:new, :create]
      resources :users, only: [:show]

      resources :locations, only: [:new, :create, :edit, :update, :destroy]
      resources :location_reviews, only: [:create]
    end
  end
end

