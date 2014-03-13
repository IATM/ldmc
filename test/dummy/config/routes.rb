Rails.application.routes.draw do

  #mount Ldmc::Engine => "/ldmc"
  
  root to: "visits#index"
end
