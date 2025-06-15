Rails.application.routes.draw do
  # config/routes.rb
  devise_for :teachers, path: "auth/teachers"
  devise_for :students, path: "auth/students"

  namespace :teacher do
    resources :courses do
      resources :assignments do
        resources :submissions, only: [ :index, :show ]
      end
      resources :posts do
        resources :comments
      end
    end
  end


  namespace :student do
    resources :courses, only: [ :index, :show ] do
      collection do
        get :select
        get :upcoming_assignments
        get :progress_bar
        get :fetch_posts
        post :enroll
        delete :unenroll
      end
      resources :posts do
        resources :comments
      end
      resources :assignments, only: [ :index, :show ] do
        resources :submissions, only: [ :index, :show, :new, :create ]
      end
      end
end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "home#index"
end
