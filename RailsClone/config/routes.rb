Rails.application.routes.draw do
  resources :clones do
    collection do
      post :confirm
    end
  end
end
