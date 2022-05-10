Rails.application.routes.draw do
  use_doorkeeper_openid_connect
  use_doorkeeper
  devise_for :users

  namespace :api do
    namespace :v1 do
      get '/me' => 'credentials#me'
    end
  end

  root 'home#index'
end
