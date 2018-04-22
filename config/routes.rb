Rails.application.routes.draw do
  devise_for :users
  resources :members, only: [:create, :destroy]
  get "/groups/search" => "groups#search"
  patch "/groups/:group_id/charges/:user_id/:other_id" => "charges#update"
  resources :groups do
      resources :charges, only: [:create, :show, :index]
  end
  root "groups#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
