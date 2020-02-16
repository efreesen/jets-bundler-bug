Rails.application.routes.draw do
  get ":url_id", to: "redirects#index"
  post "shorten", to: "shorten#create"
  post "batch", to: "batch#create"
end
