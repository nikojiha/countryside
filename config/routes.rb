Rails.application.routes.draw do

   devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    root to: 'homes#top'
    resources :freezes, only: [:index]
    resources :tags, except: [:new,:show]
    resources :posts, only: [:index,:show,:destroy]
    resources :customers, only: [:show,:index] do
     resource :freeze, only: %i[create destroy], module: 'accounts'
    end
  end

  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    post 'guests/guest_sign_in', to: 'guests#new_guest'

    resources :customers, except: [:new,:create] do
      member do
        get :follows, :followers
        get :unsubscribe
      end
      resource :relationships, only: [:create, :destroy]
    end

    resources :posts do
      resource :favorites, only: [:create,:destroy]
      resources :comments, except: [:index,:show]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
