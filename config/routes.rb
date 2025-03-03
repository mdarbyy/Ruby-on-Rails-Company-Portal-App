Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  authenticated :user do
    
    resources :forms do
      resources :form_fields, only: [:create, :edit, :update, :destroy]
      resources :form_submissions, only: [:new, :create, :show, :destroy]
    end

    resources :posts do
      member do
        delete :remove_attachment
      end
    end

    resources :settings
    resources :users

    post 'admin/users', to: 'users#create', as: 'admin_create_user'

    get 'static_pages/employee_information', to: 'static_pages#employee_information', as: 'employee_information'
    get 'static_pages/home', to: 'static_pages#home', as: 'home'
  end

  root "static_pages#home"
end
