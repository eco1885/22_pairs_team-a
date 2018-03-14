Rails.application.routes.draw do
  devise_for :users
  root 'pairs#index'
end
