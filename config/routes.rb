Rails.application.routes.draw do
  root "characters#index"
  resources :characters, only: [:index, :destroy]
end
