Rails.application.routes.draw do
  root "redirects#index"	
  resources :redirects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
