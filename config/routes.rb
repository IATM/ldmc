Ldmc::Engine.routes.draw do
  get 'read_sequences', to: 'read_sequences#all'
  resources :subjects do
    resources :read_generals
    resources :read_sequences do
      resources :lesions
    end
  end
  root to: 'subjects#index'
end


# get 'work_orders', to: 'work_orders#all'
#   get 'read_sequences', to: 'ldmc/read_sequences#all'
#   get 'read_generals', to: 'ldmc/read_generals#all'
