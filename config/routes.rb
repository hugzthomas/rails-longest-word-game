Rails.application.routes.draw do
  get '/game' => 'game#play'
  get '/score' => 'game#score'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
