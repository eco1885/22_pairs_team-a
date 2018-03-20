Rails.application.routes.draw do

  devise_for :users do
    member do
     get :following, :followers
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pairs#index'
  get 'messages' => 'pairs#messages_index'
  resources:relationships, only: [:create, :destroy]
  get 'like/from_partner' => 'pairs#from_partner'
  get 'like/from_me'  => 'pairs#from_me'
  get 'like/favorite' => 'pairs#favorite'
  get  "myprofile" => "pairs#myprofile"
end
