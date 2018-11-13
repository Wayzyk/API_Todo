Rails.application.routes.draw do
  resources :projects do
    resources :tasks
  end

  post 'auth/sign_in', to: 'authentication#authenticate'

  post 'auth', to: 'users#create'
end
