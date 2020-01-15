Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'users/signup', to: 'users#create'
      post 'users/login', to: 'authentication#authenticate'
      post 'users/forgetpassword', to: 'authentication#send_reset_token'
      post 'users/resetpassword', to: 'authentication#reset_password'
      get 'users/me', to: 'users#show'
      put 'users/:id', to: 'users#update'
      post 'users/changepassword', to: 'users#change_password'

      resources :records, except: [:create, :new, :edit] do
        collection do
          post :start, to: 'records#start'
          post :end, to: 'records#end'
          get :monthly, to: 'records#monthly'
        end
      end
      resources :monthly_reports, only: [:index, :show] do
        collection do
          post :recalculate, to: 'monthly_reports#recalculate'
        end
      end
    end
  end
end
