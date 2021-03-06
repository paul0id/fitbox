Rails.application.routes.draw do
  devise_for :users
  root 'users#main'
  resources :users, only: [:show, :destroy], as: :my_user
  get '/managers' => 'users#managers'
  get '/clients' => 'users#clients'
  scope "/admin" do
    resources :users, only: :create, as: :create_user
  end
  resources :fit_boxes do
    get 'accept'      => 'fit_boxes#accept'
    get 'reject'      => 'fit_boxes#reject'
    get 'return'      => 'fit_boxes#return'
    get 'return_back' => 'fit_boxes#return_back'
    get 'add_item_to_box' => 'fit_boxes#add_item_to_box'
    get 'remove_item_from_box' => 'fit_boxes#remove_item_from_box'

  end

  resources :items

  post '/fit_boxes/new_box' => 'items#items_to_box', as: :create_fit_box
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
