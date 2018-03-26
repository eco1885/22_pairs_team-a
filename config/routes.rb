Rails.application.routes.draw do
  devise_for :users do
  #マッチング機能のためのrouting1
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  #ユーザー情報登録のためのrouting
  resources :users, only: [:show] do
    resources :details, only: [:edit, :update]
  end
  #検索機能関連のrouting
  get 'searches' =>  'searches#search_index'
  get 'search_result' => 'searches#search_result'
  #その他
  root 'pairs#index'
  get 'messages' => 'pairs#messages_index'
  get 'like/from_partner' => 'pairs#from_partner'
  get 'like/from_me'  => 'pairs#from_me'
  get 'like/favorite' => 'pairs#favorite'
  get "myprofile" => "pairs#myprofile"
  get "searchone" => "pairs#search_one"
  get "visitorlist" => "pairs#visitor_list"
  get "visitorlistzero" => "pairs#visitor_list_zero"
  get "visitorsetting" => "pairs#visitor_setting"
  get "parts" => "pairs#parts"
  get "community/create" => "communities#new"
  get "community/complete" => "communities#complete"
  resources :communities, path: "community", only: [:index, :create, :show] do
    collection do
      get  "search"
      post "confirm"
    end
  end
end
