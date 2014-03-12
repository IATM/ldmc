Ldmc::Engine.routes.draw do
  resources :visits do
    resources :read_sequences do
      resources :lessions
    end
    
  end
end
