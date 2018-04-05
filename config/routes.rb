Rails.application.routes.draw do
    get "/groups/search" => "groups#search"
  resources :groups
  root "groups#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
