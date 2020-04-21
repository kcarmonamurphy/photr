Rails.application.routes.draw do
  default_url_options host: "photr.lvh.me", port: 3000

  scope '/api/v1' do
    use_doorkeeper
  end

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

  root to: 'frontend#index', via: :get
  get '/*path' => 'frontend#index', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
