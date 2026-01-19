Rails.application.routes.draw do
  # Health checks
  get "up" => "rails/health#show", as: :rails_health_check
  get "/health", to: "health#index"

  # API routes
  namespace :api do
    get "/ping", to: "test#ping"
  end
end
