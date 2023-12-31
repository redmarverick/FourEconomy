Rails.application.routes.draw do
  get 'splash/index'
  get 'home', to: 'groups#index', as: 'home'
  root to: 'splash#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }, path_names: {
    new_password: 'forgot',
    edit_password: 'reset'
  }
  resources :groups, only: [:index, :show, :new, :create]
  resources :entities, only: [:create, :new]
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new'
  end
end
