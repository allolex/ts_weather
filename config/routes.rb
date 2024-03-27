Rails.application.routes.draw do
  resources :deletemes
  get 'forecast', controller: :forecast, action: :query
  post 'forecast', controller: :forecast, action: :display

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
