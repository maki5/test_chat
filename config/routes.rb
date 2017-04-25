Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'home/login', to: 'home#login', as: 'login'

  get 'chat_room/:id', to: 'chat_rooms#show', as: 'chat_room'

  root to: 'home#index'
end
