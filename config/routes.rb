Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :operating_systems
  resources :computers do
    collection do
      get :new_import
      post :create_import
    end
  end

  get 'welcome/index'

  get 'welcome/hello'

  get 'welcome/version'

  root :controller => 'computers', :action => 'index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
