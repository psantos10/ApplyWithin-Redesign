Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "users/registrations" } do
  end

  devise_scope :user do
    get 'signup_business', :to => 'devise/registrations#new'
    get 'signup_hunter', :to => 'devise/registrations#new'
    post 'signup_business', :to => 'devise/registrations#new'
    post 'signup_hunter', :to => 'devise/registrations#new'
  end

  as_root = -> {
    { only: %i[edit update show destroy] }
  }

  as_nested = -> {
    { only: %i[index new create] }
  }

  root to: "static_pages#index"
  
  resources :businesses do
    member do
      get :edit_job
      put :update_job
      get :edit_info
      put :update_info
      get :edit_contact
      put :update_conact
      get :edit_about
      put :update_about
      get :edit_hours
      put :update_hours
    end
    resources :positions, as_nested.()
    resources :business_hours, as_nested.()
  end

  resources :positions, as_root.()
  resources :positions do
    member do
      get :edit_info
      put :update_info
      get :edit_detail
      put :update_detail
      get :edit_about
      put :update_about
      get :edit_all
      put :update_all
    end
  end

  resources :business_hours, as_root.()

  resources :hunters do
    member do
      get :edit_profile
      put :update_profile
      get :edit_times
      put :update_times
      get :edit_cover_photo
      put :update_cover_photo
      get :edit_about
      put :update_about
    end
    resources :experiences, as_nested.()
    resources :educations, as_nested.()
    resources :languages, as_nested.()
    resources :availabilities, as_nested.()
    resources :auto_applications, as_nested.()
    resources :available_times, as_nested.()
  end

  resources :experiences, as_root.()
  resources :educations, as_root.()
  resources :languages, as_root.()
  resources :availabilities, as_root.()
  resources :auto_applications, as_root.()
  resources :available_times, as_root.()

  resources :positions do
    resources :position_applications, as_nested.()
    resources :position_advertisements, as_nested.()
  end

  resources :position_advertisements, as_root.()
  resources :position_applications, as_root.()


  resources :position_advertisements do
    resources :position_applications, as_nested.()
  end

  resources :position_applications do
    member do
      put 'reject_application'
      put 'cancel_application'
    end
  end

  resources :galleries
  resources :searches
  resources :photos
  resources :impressions, only: %i[create]
  resources :auto_applications

  get 'hunters/:id', to: 'hunters#show', as: :hunter_profile
  get 'dashboard/index', as: :dashboard

  get 'static_pages/index'
  get 'privacy_policy', :to => 'static_pages#privacy_policy'
  get 'general_terms', :to => 'static_pages#general_terms'
  get 'business_terms', :to => 'static_pages#business_terms'
  get 'hunter_terms', :to => 'static_pages#hunter_terms'
  get 'about', :to => 'static_pages#about'
  get 'contact', :to => 'static_pages#contact'
  get 'help', :to => 'static_pages#help'

  match '/contacts', to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]

  get 'errors/not_found'
  get 'errors/internal_server_error'

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

end

