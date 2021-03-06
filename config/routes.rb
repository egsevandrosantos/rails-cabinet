Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  get 'welcome', to: 'welcome#index'
  resources :docs
  authenticated :user do
    root "docs#index", as: "authenticated_root"
  end
  root to: 'welcome#index'
end
