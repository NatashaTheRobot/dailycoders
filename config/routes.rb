Dailycoders::Application.routes.draw do

  resources :courses
  resources :users

  root to: "users#new"
  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout

end
