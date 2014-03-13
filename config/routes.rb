Ldmc::Engine.routes.draw do
  resources :read_generals

  get "read_general/show"
  get "read_general/edit"
  get "read_general/new"
  get "read_general/create"
  get "read_general/update"
  get "read_general/destroy"
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
