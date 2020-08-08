Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#home"
  resources :boards do
    resources :posts, shallow: true
  end
end
