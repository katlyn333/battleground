Rails.application.routes.draw do
  resource :contest, only: [:show]
end
