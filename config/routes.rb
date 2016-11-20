Rails.application.routes.draw do

  get  '/students', to: 'students#index', as: :students
  post '/students', to: 'students#create', as: :create_student
  get  '/students/new', to: 'students#new', as: :new_student
  get  '/students/:id/edit', to: 'students#edit', as: :edit_student
  patch '/students/:id/update', to: 'students#update', as: :update_student


  get '/artifacts', to: 'artifacts#index', as: :artifacts
  get '/artifacts/new', to: 'artifacts#new', as: :new_artifact
  post '/artifacts', to: 'artifacts#create', as: :create_artifact


  root "application#root"
end
