Rails.application.routes.draw do
  resources :contests, only: [:show, :index, :create]
end
