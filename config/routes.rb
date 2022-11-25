Rails.application.routes.draw do

    devise_for :admins
   
    root "admins/admins#index"
    namespace :admins do
        resources :admins
        resources :roles
        resources  :projects
        resources  :attendances
        resources  :holidays
    end
end