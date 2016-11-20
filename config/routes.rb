Rails.application.routes.draw do
  get '/', to: 'students#index', as: :students
  get '/students/:id/artifacts', to: 'artifacts#index', as: :student_artifacts

  root "students#index"
end
