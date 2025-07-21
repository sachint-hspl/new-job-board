Rails.application.routes.draw do
  root "job_postings#index"

  resources :job_postings
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
end
