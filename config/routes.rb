Rails.application.routes.draw do
  resources :groups do
    resources :memberships
  end
  root :to => 'groups#index'
end
