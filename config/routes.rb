Rails.application.routes.draw do
  devise_for :users
  root 'pairs#index'
  get 'messages' => 'pairs#messages_index'
  get 'like' => 'pairs#from_partner'

end
