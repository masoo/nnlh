Rails.application.routes.draw do
  root to: "top#index"

  get "image", to: "top#show_image"
  post "g", to: "top#create"
end
