Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#home"
  resources :boards do
    resources :posts, shallow: true
  end

  resources :users, only: [:create, :edit, :update] do
    collection do
      get :home
      get :sign_up
      get :sign_in
      post :login
      delete :sign_out
    end
  end
end
