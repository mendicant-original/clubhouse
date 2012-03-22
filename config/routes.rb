Clubhouse::Application.routes.draw do
  match '/auth/:provider/callback' => 'sessions#create'

  resources :people, :except => [ :new ]
end
