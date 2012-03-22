Clubhouse::Application.routes.draw do
  match '/auth/:provider/callback' => 'sessions#create'

  resources :admissions    
  resources :people

  root :to => "admissions#new"
end
