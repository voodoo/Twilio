ActionController::Routing::Routes.draw do |map|
  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  
  map.resources :callmes, 
                :collection => {:thanks => :get, :list => :get}, 
                :member => {:confirm => :post, :callme => :post, :pet_found => :post}
  map.resources :sessions
  map.resources :users, :has_many => :pets
  map.resources :pets, 
                  :member => {
                    :message => :get,
                    :leave_message => :post
                  },
                  :collection => 
                    {
                      :lost => :get, 
                      :found => :get, 
                      :search => :get, 
                      :cats => :get, 
                      :dogs => :get

                      }


  # Couldn't find a better way to do this but this works
  map.harness '/twiml/test_harness', :controller => 'twiml', :action => 'test_harness'
  map.connect '/twiml/:id.:format', :controller => 'twiml', :action => 'index'
  map.connect '/twiml.:format',     :controller => 'twiml', :action => 'index'
  
  map.resources :twimls, :member => {:move_higher => :put, :move_lower => :put}
  map.resources :verbs,  :member => {:move_higher => :put, :move_lower => :put}
  
  map.root :controller => "home" 
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.


  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.

end
