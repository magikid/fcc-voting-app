Rails.application.routes.draw do
  resources :polls do
    resources :responses, only: :new
  end

  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
