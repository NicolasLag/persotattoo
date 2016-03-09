Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  get "style" => "pages#style"
  get "me" => "pages#me"
  get "me_profile" => "pages#me_profile"

  root to: 'pages#home'

  get 'sign_up_artist' => 'pages#sign_up_artist'
  get 'me_artist' => 'pages#me_artist'
  get 'me_artist_proposals' => 'pages#me_artist_proposals'
  get 'me_artist_winnings' => 'pages#me_artist_winnings'
  get 'me_winnings' => 'pages#me_winnings'


  devise_for :users , controllers: { registrations: "users/registrations", omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :projects, only: [:index, :show, :new, :create, :edit, :update, :destroy]  do
    resources :proposals, only: [:index, :new, :create] do
      resources :reviews, only: [:index,:new, :create, :destroy]
    end
    resources :hidden_projects, only: [:create]
  end

  resources :proposals, only: [:show, :update] do
    resources :messages, only: [:create]
  end

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

end
