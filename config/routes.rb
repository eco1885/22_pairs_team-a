Rails.application.routes.draw do
  devise_for :users
  root 'pairs#index'
  get 'messages' => 'pairs#messages_index'
  get 'like/from_partner' => 'pairs#from_partner'
  get 'like/from_me'  => 'pairs#from_me'
  get 'like/favorite' => 'pairs#favorite'

end
