Rails.application.routes.draw do
  root "users#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    collection do
      post :avatar_preview
    end
  end
end
