
Rails.application.routes.draw do
  devise_for :customers
  root 'users#index'
  resources :users

  # Example 1 :- Root Routes.
  # root "users#index"
  # root to: 'users#index'

  # Example 2 :- as method change the path name
  # get 'exit', to: 'sessions#destroy'
  # get 'exit', to: 'sessions#destroy', as: :logout

  # Example 3 :- Redirect Path Example
  # resources :posts
  # get '/blogs', to: redirect('https://www.google.co.uk/')
  # get '/blogs/new', to: redirect('/posts/new')

  # Example 4 :- Format
  # namespace :api do
  #   namespace :v1 do
  #     resources :blogs, defaults: { format: :json }
  #   end
  # end

  # Example 5 :- Resources Routes.
  # Example 1
  # resources :photos, :posts
  # Example 2
  # resources :books
  # resources :video

  # Example 6 :- Resource with specific routes
  # resources :blogs, only: [:index, :show]

  # Example 7 :- Resource with different controller.
  # resources :blogs, controller: 'users'

  # Example 8 :- Collection routes.
  # Define first way
  # resources :blogs do
  # 	collection do
  # 		get 'search'
  # 	end
  # end

  # Define Second Way
  # resources :blogs do
  # 	get 'search', on: :collection
  # end

  # Blog Shallow Nested Routes Example
  # Namespace Routes
  # namespace :admin do
  #   resource :super_admin, :plans
  # end

  # Namespace Scope Routes
  # Scope With Module
  # Define first way
  # scope module: 'admin' do
  #   resources :super_admin, :plans
  # end

  # Define Second way
  # resource :super_admin, :plans, module: 'admin'

  # Define scope
  # scope '/admin' do
  # 	resources :super_admin
  # end

  # ShallowRoutes
  # resources :users, :shallow => true do
  #   resources :posts
  # end

  # Load External Routes file routes_concern.rb
  draw :routes_concern


  # Rails Routes Constraints
  # 1. Regular Expression
  resources :products, only: [:index, :new, :edit, :update, :destroy]
  get 'products/:id', to: 'products#show', as: :show_product, constraints: { id: /\d+/ }

  # 2.HTTP Verb Constraints
  match '/products/:id', to: 'products#update', via: [:put, :patch]

  # 3. Request based Constraints
  # Example 1 
    constraints LangVerifyConstraint.new do 
      get 'hello', to: 'greetings#hindi'
    end
    get 'hello', to: 'greetings#english'
  
  # Example 2: API VERSION
  # Version 1 - Mobile and Desktop
    constraints ApiVersionConstraint.new('v1') do 
      # If this fails then it will Rails moves to the next matching route in the routing table. 
      get 'api/v1/users', to: 'api/v1/users#index_v1'
    end 

  # Version 2 - Mobile and Desktop
    constraints(ApiVersionConstraint.new('v2')) do
      get 'api/v2/users', to: 'api/v2/users#index'
    end

  # Fallback if no version matches (default v1)
    get 'api/v1/users', to: 'api/v1/users#old_customer'
    get 'api/v2/users', to: 'api/v2/users#old_customer'

  # 4. Advance Constraints
    # Example 1 Blocking Fake Orders Based on Order Frequency (Rate Limiting)
      resources :orders, only: [:index, :new, :edit, :update, :show, :destroy]

      # constraints SuspiciousEmailConstraint.new do
      #   post 'orders', to: 'orders#create' 
      # end 

    # Fallback route for suspicious emails
    # post 'orders', to: 'orders#suspicious_email'

    # Example 2 Blocking Fake Orders Based on Order Frequency (Rate Limiting)
    # constraints RateLimitConstraint.new do
    #   post 'orders', to: 'orders#create'
    # end 

    # Fallback route for suspicious emails
    # post 'orders', to: 'orders#rate_limit_exceeded'

    # Example 3 Blocking Fake Orders Based on Excessive Quantity
      constraints QuantityLimitConstraint.new do
        post 'orders', to: 'orders#create'
      end 

    # Fallback route for suspicious emails
    post 'orders', to: 'orders#order_qty__limit_exceeded'

  # 4. Rails Uniq routes
  # Rake Exmple
  get '/rack_app', to: MyRackApp.new

end
