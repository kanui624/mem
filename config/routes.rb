Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#initial' 
  get 'info_page', to: 'static_pages#info_page'
  get 'about', to: 'static_pages#about'
  resources :mems do 
    resources :mem_photos, only: :create
  end 
end
