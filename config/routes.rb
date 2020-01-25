Rails.application.routes.draw do
  get 'images/index'
  get 'images/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :images
    end
  end
end
