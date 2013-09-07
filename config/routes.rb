Dailycoders::Application.routes.draw do

  root to: "groups#index"
  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout

  resources :groups

end
