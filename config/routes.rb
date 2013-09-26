Dailycoders::Application.routes.draw do

  root to: "users#new"

  get "/auth/:provider/callback" => "user_sessions#create"
  get "/signout" => "user_sessions#destroy", :as => :signout

  resources :users, path: 'coders'
  resources :courses do
    resources :sessions, except: :show
  end

  get "/:id" => "sessions#show", as: :session

end
