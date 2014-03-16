SimpleCms::Application.routes.draw do
  #get "demo/index"

  root "demo#index"

  match ':controller(/:action(/:id))', :via => :get


 
end
