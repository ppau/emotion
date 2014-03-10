Rails.application.routes.draw do

  devise_for :users

  resources :groups do
    resources :motions, except: [:index] do
      get 'vote/yes', to: 'votes#update', as: :vote_yes, defaults: {response: 'yes'}
      get 'vote/no', to: 'votes#update', as: :vote_no, defaults: {response: 'no'}
      get 'vote/abstain', to: 'votes#update', as: :abstain, defaults: {response: 'abstain'}
    end
  end

  root 'welcome#index'
end
