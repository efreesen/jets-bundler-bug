Jets.application.routes.draw do
  get 'api', to: 'api#index'

  root "api#index"
end
