Rails.application.routes.draw do
  # Root URL of the app
  root to: "static_pages#index"

  # Devise routes
  devise_for :users
  
  # By using the format false option, we restrict the non-api part of the site to only serving html
  scope :format => false do
    resources :cars, defaults: { format: :html}
  end
  
  # By using the format false option, we restrict the api to only serving json
  scope :api, :format => false do
    resources :cars, defaults: { format: :json}
  end

  # Redirect everything not explicitly defined to reactjs
  get "*path" => "static_pages#index"
end
