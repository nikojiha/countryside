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
    resources :freezes, only: :index
    resources :tags, except: [:new,:show]
    resources :posts, only: [:index,:show,:destroy]
    resources :customers, only: [:index,:show] do
     resource :freeze, only: %i[create destroy], module: 'accounts'
    end
  end
  
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    resources :comments, except: [:index,:show]
    resources :customers, except: [:new,:create] do
      member do
        get :follows, :followers
      end
      resource :relationships, only: [:create, :destroy]
    end
    resources :posts 
    resources :favorites, only: [:create,:destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
