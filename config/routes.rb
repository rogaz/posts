Posts::Application.routes.draw do
  root :to => "Posts#index"

  resources :users
  get "users/:id/edit_password" => "users#edit_password", :as => :edit_user_password
  post "users/:id/update_password" => "users#update_password", :as => :update_user_password
  get "users/:id/edit_image" => "users#edit_image", :as => :edit_user_image
  post "users/:id/update_image" => "users#update_image", :as => :update_user_image

  resources :posts, :only => [:index, :new, :create, :show, :destroy]
  resource  :user_session, :only => [:new, :create, :destroy]

  delete "logout" => "user_sessions#destroy", :as => :logout


  match "sign_in" => "User_sessions#new", :as => "signin"
  match "sign_up" => "Users#new", :as => "signup"
  match "posts/persona/:id" => "Posts#index", :as => "user_posts"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
