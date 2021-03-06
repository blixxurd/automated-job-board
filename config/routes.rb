Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get 'job/:page' => 'pages#listing'
  get 'redirect' => 'pages#redirect'

  get 'feed' => 'application#feed'

  get 'sitemap.xml' => 'sitemap#index'
  get 'sitemap/pages.xml' => 'sitemap#pages'
  get 'sitemap/jobs.xml' => 'sitemap#jobs'

  # Posts
  post 'submit/lead' => "input#submit_lead"

  get ':page' => 'pages#page'
end
