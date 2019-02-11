Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  
  constraints Clearance::Constraints::SignedIn.new { |user| user.admin? } do
    mount Sidekiq::Web, at: '/sidekiq'
  end
  
  # ––––––––––––– Clearance Stuff ––––––––––––––––––––––
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]

    resource :dashboard, only: [:show]
  end

  resources :puzzles, only: [:show, :index]


  resources :courses, only: [:show, :index]

  

  get "/sign_in" => "welcome#index", as: "sign_in"

  # For Oauth routing
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"


  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboards#show'
  # Landing Page 
  resources :welcome, only: [:index]

  # path to update users programming_languages
  # post '/user/:id/update_user_languages' => 'users#update_user_language'
  # path to update users programming_language_skill
  post '/user/:id/update_language_skill' => 'users#update_user_language_skill'
  # path to update users developer_type
  post '/user/:id/update_developer_type' => 'users#update_user_developer_type'
  # path to update users current interest
  post '/user/:id/update_current_interest' => 'users#update_user_current_interest'
end
