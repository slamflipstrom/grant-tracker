GrantTracker::Application.routes.draw do
 
  root :to => 'pages#index'
  get '/dashboard' => 'pages#dashboard', as: 'dashboard'
  
  get '/new/user' => 'organizations#new_user', as: 'org_user'
  get '/new/grant' => 'grants#new', as: 'org_grant'
  get '/new/:id/task' => 'tasks#new', as: 'org_task'
  
  get '/edit' => 'organizations#edit', as: 'edit_org'
  
  get '/signup' => 'organizations#new', as: 'signup'
  get '/organizations/:id/new_user' => 'organizations#new_user', as: 'organization_user'
  post '/users' => 'organizations#create_user'
  
  root :to => 'users#index'
  
  resources :user_sessions
  resources :users, path: 'user'
  get '/users' => 'users#index', :as => 'users'
  resources :tasks, path: 'task'
  resources :grants, path: 'grant'
  resources :organizations, path: 'organization'

  put '/task/:id/assign' => 'tasks#assign_user'
  put '/user/:id/assign' => 'tasks#assign_task'
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout


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
