Rails.application.routes.draw do

  mount_ember_app :frontend, to: "/"

  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index, :show, :create, :update, :destroy]
      resources :comments, except: [:new, :edit]
    end
  end
end
