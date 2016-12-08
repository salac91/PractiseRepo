Rails.application.routes.draw do

  root to: 'pages#index'

  devise_for :users, :controllers => { sign_up: 'registrations' }

  get 'schedules/summary' => 'schedules#summary'

  resources :companies 

  resources :users do
  	  resources :schedules 
  end
  
end
