Testr::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  use_doorkeeper
  devise_for :users

  # API
  namespace :api do
    namespace :v1 do
    end
  end
end

BackboneRoutes.draw("pages#home") do
  match "dashboard" => "dashboard"
  root to: "dashboard"
end