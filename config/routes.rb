Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  get "me" => "pages#me"
  get "me_profile" => "pages#me_profile"

  root to: 'pages#home'

  get 'sign_up_artist' => 'pages#sign_up_artist'

  get 'me_artist' => 'pages#me_artist'
  get 'me_artist_proposals' => 'pages#me_artist_proposals'


  devise_for :users , controllers: { registrations: "users/registrations", omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  resources :projects, only: [:index, :show, :new, :create, :edit, :update, :destroy]  do
    resources :proposals, only: [:index, :show, :new, :create]
  end
  resources :proposals, only: :update

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end

  resources :messages, only: [:new, :create]

end
