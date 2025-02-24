Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users'
  }

  authenticated :user do
    
    resources :posts do
      member do
        delete :remove_attachment
      end
    end

    resources :settings
    resources :users
    get 'static_pages/home', to: 'static_pages#home', as: 'home'
  end

  root "static_pages#home"
end
