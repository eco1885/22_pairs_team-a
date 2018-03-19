Rails.application.routes.draw do
  devise_for :users
  root 'pairs#index'
  get  "myprofile" => "pairs#myprofile"

  get 'like' => 'pairs#from_partner'
  get 'messages' => 'pairs#messages_index'

end
