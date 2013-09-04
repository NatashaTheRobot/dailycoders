Dailycoders::Application.routes.draw do

  root to: "users#new"
  get "/auth/:provider/callback" => "sessions#create", ssl: { verify: false }
  get "/signout" => "sessions#destroy", :as => :signout

end
