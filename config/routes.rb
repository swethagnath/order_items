Rails.application.routes.draw do
  namespace :api, format: 'json' do 
    namespace :v1 do        
      resources :items
      resources :orders
    end
  end
end
