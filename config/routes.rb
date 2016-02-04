Rails.application.routes.draw do

  devise_for :companies, controllers: {
    registrations:  "companies/registrations",
    sessions:       "companies/sessions",
    passwords:      "companies/passwords"
  }

  root to: "dashboard#index"

  match '/account/login', to: 'account#login', via: 'get'
  match '/account/registration', registrationto: 'account#', via: 'get'

  resources :projects do
    resources :comments, except: [:index, :show, :delete]
  end
  match 'order_projects', to: 'projects#order_index', via: 'get'
  match 'receive_projects', to: 'projects#receive_index', via: 'get'

  resources :commitments, except: [:show]

  resources :reviews, only: [:new, :create]

  resources :companies
end
