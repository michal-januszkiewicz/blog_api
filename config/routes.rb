Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      resources :posts, only: [:show]
    end
  end
end
