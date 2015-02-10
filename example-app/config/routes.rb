Rails.application.routes.draw do
  scope(:api) do
    resources(:cars, defaults: {format: :json})
  end
end
