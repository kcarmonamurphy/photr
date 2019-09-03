Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "pages#home"

  get '/pages/home', to: 'pages#home'

  resources :images
   
  namespace 'api' do
    namespace 'v1' do
      get '*path', to: 'paths#index'
    end
  end

end
