Ldmc::Engine.routes.draw do
  resources :visits do
    resources :read_sequences 
    resources :lessions
    
  end
end
