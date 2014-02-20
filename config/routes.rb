Ldmc::Engine.routes.draw do
  resources :visits do
    resources :read_ldmc
  end
end