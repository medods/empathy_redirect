Rails.application.routes.draw do
  root "redirects#index"	
  get '/redirects', to: "redirects#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
