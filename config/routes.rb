Rails.application.routes.draw do
  resources :videos, only: [:index]
  get '/' => 'videos#index', :as => 'search_page_path'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
