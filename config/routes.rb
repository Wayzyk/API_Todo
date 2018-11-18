Rails.application.routes.draw do

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :projects do
      resources :tasks do
        collection do
          patch :sort
        end 
      end
    end

    resources :tasks do
      resources :comments
    end
  end


  post 'auth/sign_in', to: 'authentication#authenticate'
  
  post 'auth/sign_out', to: 'authentication#destroy'

  post 'auth', to: 'users#create'
end
