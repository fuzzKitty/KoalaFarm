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

  post 'password/forgot', to: 'password#forgot'
  post 'password/reset', to: 'password#reset'

  root 'admin#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
