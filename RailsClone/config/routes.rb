Rails.application.routes.draw do
  root 'clones#index'
  resources :clones do
    collection do
      post :confirm
    end
  end
end
