Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  default_url_options host: "photr.lvh.me", port: 3000

  root "pages#home"

  get '/pages/home', to: 'pages#home'

  resources :images
   
  namespace 'api' do
    namespace 'v1' do
      jsonapi_resources :folders do
        jsonapi_relationships
        member do
          post 'upload_image', to: 'folders#upload_image'
        end
      end

      jsonapi_resources :images do
        jsonapi_relationships
        member do
          post 'upload_attachment', to: 'images#upload_attachment'
        end
      end

      get 'path(/*path)', to: 'path#index'
    end
  end
end
