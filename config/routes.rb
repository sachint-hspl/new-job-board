Rails.application.routes.draw do
  root "job_postings#index"

  resources :job_postings

  resources :job_postings do
    resources :job_applications, only: [:new, :create, :index]
  end


  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end