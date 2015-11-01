Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root to: 'pages#home'

  namespace :account do
    resource :dashboard, only: :show, controller: 'dashboard' do
      resource :users, only: [:edit, :update]
    end
  end

  namespace :group, module: 'groups' do
    scope ':group' do
      root to: 'home#show'

      resources :activities do
        resources :bookings, only: [:new, :create, :destroy] do
          resources :comments, only: [:create]
        end
      end

      resources :newsfeeds, only: [:new, :create]
      resources :users, only: [:show]

      resources :locations, only: [:new, :create, :edit, :update, :destroy]
      resources :location_reviews, only: [:create]
    end
  end
end

