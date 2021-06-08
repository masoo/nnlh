Rails.application.routes.draw do
  root to: "top#index"

  get "s", to: "top#s"
  post "g", to: "top#create"
end
