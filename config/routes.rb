Rails.application.routes.draw do

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :projects do
      resources :tasks
    end
  end

  scope module: :v2, constraints: ApiVersion.new('v2') do
    resources :projects, only: :index
  end


  post 'auth/sign_in', to: 'authentication#authenticate'

  post 'auth', to: 'users#create'
end
