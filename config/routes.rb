Rails.application.routes.draw do
  devise_for :users do
    member do
     get :following, :followers
    end
  end

  root 'pairs#index'
  get 'messages' => 'pairs#messages_index'
  resources :relationships, only: [:create, :destroy]
  get 'like/from_partner' => 'pairs#from_partner'
  get 'like/from_me'  => 'pairs#from_me'
  get 'like/favorite' => 'pairs#favorite'
  get "myprofile" => "pairs#myprofile"
  get "searchone" => "pairs#search_one"
  get "visitorlist" => "pairs#visitor_list"
  get "visitorlistzero" => "pairs#visitor_list_zero"
  get "visitorsetting" => "pairs#visitor_setting"
  get "parts" => "pairs#parts"
  get "community/view" => "communities#show"
  get "community/create" => "communities#new"
  get "community/complete" => "communities#complete"
  resources :communities, path: "community", only: [:index, :create] do
    collection do
      get  "search"
      post "confirm"
    end
  end
end
