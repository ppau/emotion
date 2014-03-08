Rails.application.routes.draw do

  devise_for :users

  resources :groups, only: [:show] do
    resources :motions, except: [:index]
  end

  root 'welcome#index'
end
