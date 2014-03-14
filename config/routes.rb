Ldmc::Engine.routes.draw do
  get 'read_sequences', to: 'read_sequences#all'
  get 'read_generals', to: 'read_generals#all'
  resources :subjects do
    resources :read_generals
    resources :read_sequences do
      resources :lesions
    end
  end
  resources :participants
  root to: 'subjects#index'
end
