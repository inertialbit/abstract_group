AbstractGroup.app_type.routes.draw do
  resources :groups
  root :to => 'groups#index'
end
