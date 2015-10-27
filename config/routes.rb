Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :account do
    resource :dashboard, only: :show, controller: 'dashboard'
  end

  namespace :group do
    scope ':group' do
      resource :home, only: :show

      resources :activities do
        resources :bookings, only: [:new, :create, :destroy]
      end

      resources :newsfeeds, only: [:new, :create]
      resources :users, only: [:show]

      resources :locations, only: [:new, :create, :edit, :update, :destroy]
      resources :location_reviews, only: [:create]

      resources :bookings, only: [] do
        resources :comments, only: [:create]
      end

    end
  end
end
