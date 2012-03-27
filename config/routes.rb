Clubhouse::Application.routes.draw do
  get "submission/new"

  get "submission/create"

  match '/auth/:provider/callback' => 'sessions#create'

  resources :admissions, :only => [:new, :create] do
    resources :submissions, :only => [:new, :create]
  end
  
  resources :people

  root :to => "admissions#new"
end
