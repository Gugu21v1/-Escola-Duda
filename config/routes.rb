Rails.application.routes.draw do
  get 'join_materias_profs/new'
  get 'join_materias_profs/create'
  devise_for :users
  root to: "pages#home"

  resources :salas do
    resources :professors
    resources :alunos do
      resources :notas_alunos, only: %i[new create]
    end
  end
  resources :joins, only: %i[new create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
