Rails.application.routes.draw do
  get 'user_images/create'
  # get 'vehicles/create'

  

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    # passwords: 'users/passwords'
  },skip: [:sessions]

  
    resources :vehicles
    
  devise_scope :user do
    post 'users/sign_in', to: 'users/sessions#create', as: :user_session
    delete 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
    get 'users/profile', to: 'users/registrations#show', as: :user_profile

  end
end
