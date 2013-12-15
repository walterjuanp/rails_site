Site::Application.routes.draw do
  
  root :to => "static#home"
  
  #resources :posts, :only => [:index, :show]
  match 'blog'      => "posts#index", :as => :blog
  match "/blog/:id" => "posts#show",  :as => :post
  
  match 'home'    => "static#home",   :as => :home
  match 'about'   => "static#about",  :as => :about
  match 'search'  => "static#search", :as => :search

  resources :user_sessions
  match 'login'   => "user_sessions#new",     :as => :login
  match 'logout'  => "user_sessions#destroy", :as => :logout
  
  namespace :bo do
    match 'dashboard' => "dashboard#index"
    resources :users
    resources :tags
    resources :categories
    resources :posts
    resources :images
    resources :ajax, :only => [] do
      post 'kramdown_to_html', :on  => :collection
    end
  end
  
  mathjax 'mathjax'

  
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
