Rails.application.routes.draw do

  devise_for :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: "home#index"
  
  get "categories" => "categories#index", as: :categories
  get "categories/new" => "categories#new", as: :new_category
  post "categories/new" => "categories#create"
  delete "categories/:id" => "categories#destroy", as: :delete_category
  get "category/edit/:id" => "categories#edit", as: :edit_category
  post "category/edit/:id" => "categories#update"
  
  get "expenses" => "expenses#index", as: :expenses
  get "expenses/new" => "expenses#new", as: :new_expense
  post "expenses/new" => "expenses#create"
  delete "expenses/:id" => "expenses#destroy", as: :delete_expense
  get "expense/edit/:id" => "expenses#edit", as: :edit_expense
  post "expense/edit/:id" => "expenses#update"
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
