Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :salas do
    resources :professors
    resources :alunos do
      resources :notas_alunos, only: %i[new create edit update destroy]
      resources :horarios, only: %i[edit update]
    end
  end
  resources :alunos, only: %i[index]
  resources :joins, only: %i[new create]
  resources :join_materias_profs, only: %i[new create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
