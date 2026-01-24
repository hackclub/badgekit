Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "dashboard#show"

  get "/t/:slack_id", to: "redirects#show", as: :redirect

  get "/dashboard", to: "dashboard#show"
  patch "/dashboard", to: "dashboard#update"

  get "/login", to: "sessions#new"
  get "/auth/hack_club/callback", to: "sessions#create"
  get "/auth/failure", to: "sessions#failure"
  delete "/logout", to: "sessions#destroy"
end
