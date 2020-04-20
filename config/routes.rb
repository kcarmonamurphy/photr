Rails.application.routes.draw do
  use_doorkeeper
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  default_url_options host: "photr.lvh.me", port: 3000

  # get '/pages/home', to: 'pages#home'

  # scope '/api/v1' do
  #   use_doorkeeper
  # end

  resources :images

  scope format: false do
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

        jsonapi_resources :users do
          jsonapi_relationships
          collection do
            get 'me', to: 'users#me'
          end
        end

        jsonapi_resources :roles

        get 'path(/*path)', to: 'path#index'
      end
    end
  end

  root to: 'frontend#index'
  get '/*path' => 'frontend#index'
end
