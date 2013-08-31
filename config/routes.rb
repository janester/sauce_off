SauceOff::Application.routes.draw do

  get "new/vote" => "home#new"
  post "/vote" => "home#vote"

  get "/results" => "home#results"

  get "session/new"

  post "session/create"

  get "session/destroy"
  root :to => 'home#index'

end
