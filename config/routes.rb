Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'admin', to: 'pages#admin'
  resources :salas do
    resources :professors
    resources :horarios, only: %i[edit update]
    resources :alunos do
      resources :notas_alunos, only: %i[new create edit update destroy]
    end
  end
  resources :permissaos, only: %i[edit update]
  resources :alunos, only: %i[index]
  resources :joins, only: %i[new create]
  resources :join_materias_profs, only: %i[new create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
