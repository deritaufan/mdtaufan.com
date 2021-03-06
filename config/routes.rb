Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'pages#index'
  post 'contact/' => 'pages#create'
  devise_for :admins
  # get 'blogs/:id' => 'blogs#show', as: :blog
  # get 'blogs/' => 'blogs#index'
  resources :blogs, only: [:index, :show]
  get 'dashboard/' => 'dashboard#main'
  get 'dashboard/add_post' => 'dashboard#add_post'
  post 'dashboard/create_post' => 'dashboard#create_post'
  get 'dashboard/list_post' => 'dashboard#list_post'
  delete 'dashboard/delete_post/:id' => 'dashboard#delete_post', as: :dashboard_delete_post
  get 'dashboard/edit_post/:id' => 'dashboard#edit_post', as: :dashboard_edit_post
  patch 'dashboard/edit_post/:id' => 'dashboard#update_post'
  put 'dashboard/edit_post/:id' => 'dashboard#update_post'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
