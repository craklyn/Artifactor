Rails.application.routes.draw do

  get  '/students', to: 'students#index', as: :students
  post '/students', to: 'students#create', as: :create_student
  get  '/students/new', to: 'students#new', as: :new_student
  get  '/students/:id/edit', to: 'students#edit', as: :edit_student
  patch '/students/:id/update', to: 'students#update', as: :update_student


  get '/artifacts', to: 'artifacts#index', as: :artifacts
  post '/artifacts/search', to: 'artifacts#search', as: :artifact_search
  get '/artifacts/new', to: 'artifacts#new', as: :new_artifact
  get '/artifacts/:id/edit', to: 'artifacts#edit', as: :edit_artifact
  post '/artifacts/:id/update', to: 'artifacts#update', as: :update_artifact
  post '/artifacts', to: 'artifacts#create', as: :create_artifact

  get '/invite-collaborator', to: 'application#email_form', as: :new_email
  post '/send-email', to: 'application#send_email', as: :send_email

  root "application#root"
end
