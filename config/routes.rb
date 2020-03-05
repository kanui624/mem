Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#initial' 
  get 'info_page', to: 'static_pages#info_page'
  resources :mems 
end
