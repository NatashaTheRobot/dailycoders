Dailycoders::Application.routes.draw do

  root to: "users#new"

  resources :users

  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout

  get "/:id" => "users#show"

end
