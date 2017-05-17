Rails.application.routes.draw do
  get '/p/:short_id', to: 'polls#show', as: 'share'

  resources :polls do
    resources :responses, only: [:new, :create, :index]
  end

  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
