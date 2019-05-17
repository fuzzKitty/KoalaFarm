Rails.application.routes.draw do
  # get 'admin/index'
  # get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  resources :koalas

  get 'admin' => 'admin#index'

  get 'signup' => 'users#new'

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get 'passwords/request', to: 'passwords#request_form'
  get 'passwords/resetform', to: 'passwords#reset_form'
  post 'passwords/forgot', to: 'passwords#forgot', as: :password_forgot
  post 'passwords/reset', to: 'passwords#reset'

  root 'admin#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
