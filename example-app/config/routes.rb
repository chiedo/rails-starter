Rails.application.routes.draw do
  devise_for :users
  # Root URL of the app
  root to: "static_pages#index"

  resources :static_pages

  # By using the format false option, we restrict the non-api part of the site to only serving html
  scope :format => false do
    resources :cars, defaults: { format: :html}
  end
  
  # By using the format false option, we restrict the api to only serving json
  scope :api, :format => false do
    resources :cars, defaults: { format: :json}
  end

end
