Rails.application.routes.draw do

  mount TcellApi => '/api'

  devise_for :users
  resources :widgets
  resources :users, only: [:index]
  resources :waitlist_entries, only: [:index, :create, :show]

  get '/large', controller: :welcome, action: :large

  get '/ping', controller: :welcome, action: :ping

  get '/send_me_elsewhere', controller: :welcome, action: :send_me_elsewhere

  get '/some/:name', controller: :welcome, action: :some

  get '/big_transfer', controller: :files, action: :big_transfer
  get '/big_transfer_file', controller: :files, action: :big_transfer_file

  root 'welcome#index'

end
