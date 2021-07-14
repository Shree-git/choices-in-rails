Rails.application.routes.draw do
  get 'calendar/index'
  get 'inbox/index'
  get 'inbox/chat/:id', to: 'inbox#get_chat', as: 'getchats'
  get 'inbox/:id', to: 'inbox#chat', as: 'chats'
  post 'inbox/:id', to: 'inbox#create'
  devise_for :users
  resources :impulses
  resources :journals
  # get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
