Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "pages#home"

  get '/pages/home', to: 'pages#home'

  resources :images
   
  namespace 'api' do
    namespace 'v1' do
      jsonapi_resources :images
      jsonapi_resources :folders

      get 'path(/*path)', to: 'path#index'
    end
  end



end
