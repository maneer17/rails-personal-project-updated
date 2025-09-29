Rails.application.routes.draw do
  # config/routes.rb
  devise_for :students, path: "auth/students", controllers: {
  registrations: "auth/students/registrations",
  sessions: "auth/students/sessions",
  passwords: "auth/students/passwords",
  confirmations: "auth/students/confirmations",
  unlocks: "auth/students/unlocks"
}

devise_for :teachers, path: "auth/teachers", controllers: {
  registrations: "auth/teachers/registrations",
  sessions: "auth/teachers/sessions",
  passwords: "auth/teachers/passwords",
  confirmations: "auth/teachers/confirmations",
  unlocks: "auth/teachers/unlocks"
}


  namespace :teacher do
    resources :courses do
      resources :assignments do
        resources :submissions, only: [ :index, :show ]
      end
      resources :posts do
      end
    end
  end


  namespace :student do
    resources :courses, only: [ :index, :show ] do
      collection do
        get :new_courses
        get :upcoming_assignments
        get :your_progress
        get :fetch_posts
        post :enroll
        delete :unenroll
      end
      resources :posts do
        resources :comments, only: [ :create, :destroy ]
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
