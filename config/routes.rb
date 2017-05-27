Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get 'job/:page' => "pages#listing"

  get 'feed' => 'application#feed'

  # Posts
  post 'submit/lead' => "input#submit_lead"
end
