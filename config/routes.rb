Rails.application.routes.draw do
  get '/', to: 'students#index', as: :students

  root "students#index"
end
