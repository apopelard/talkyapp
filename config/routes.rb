Talkyapp::Application.routes.draw do
  # Root
  root to: 'users#index'

  # Routes for the Genre resource:
  # CREATE
  get '/genres/new', controller: 'genres', action: 'new', as: 'new_genre'
  post '/genres', controller: 'genres', action: 'create', as: 'genres'

  # READ
  get '/genres', controller: 'genres', action: 'index'
  get '/genres/:id', controller: 'genres', action: 'show', as: 'genre'

  # UPDATE
  get '/genres/:id/edit', controller: 'genres', action: 'edit', as: 'edit_genre'
  patch '/genres/:id', controller: 'genres', action: 'update'

  # DELETE
  delete '/genres/:id', controller: 'genres', action: 'destroy'
  #------------------------------

  # Routes for the Category resource:
  # CREATE
  get '/categories/new', controller: 'categories', action: 'new', as: 'new_category'
  post '/categories', controller: 'categories', action: 'create', as: 'categories'

  # READ
  get '/categories', controller: 'categories', action: 'index'
  get '/categories/:id', controller: 'categories', action: 'show', as: 'category'

  # UPDATE
  get '/categories/:id/edit', controller: 'categories', action: 'edit', as: 'edit_category'
  patch '/categories/:id', controller: 'categories', action: 'update'

  # DELETE
  delete '/categories/:id', controller: 'categories', action: 'destroy'
  #------------------------------

  # Routes for the Follower resource:
  # CREATE
  get '/followers/new', controller: 'followers', action: 'new', as: 'new_follower'
  post '/followers', controller: 'followers', action: 'create', as: 'followers'

  # READ
  get '/followers', controller: 'followers', action: 'index'
  get '/followers/:id', controller: 'followers', action: 'show', as: 'follower'

  # UPDATE
  get '/followers/:id/edit', controller: 'followers', action: 'edit', as: 'edit_follower'
  patch '/followers/:id', controller: 'followers', action: 'update'

  # DELETE
  delete '/followers/:id', controller: 'followers', action: 'destroy'
  #------------------------------

  # Routes for the Story resource:
  # CREATE
  get '/stories/new', controller: 'stories', action: 'new', as: 'new_story'
  post '/stories', controller: 'stories', action: 'create', as: 'stories'

  # READ
  get '/stories', controller: 'stories', action: 'index'
  get '/stories/:id', controller: 'stories', action: 'show', as: 'story'

  # UPDATE
  get '/stories/:id/edit', controller: 'stories', action: 'edit', as: 'edit_story'
  patch '/stories/:id', controller: 'stories', action: 'update'

  # DELETE
  delete '/stories/:id', controller: 'stories', action: 'destroy'
  #------------------------------

  # Routes for the User resource:
  # CREATE
  get '/users/new', controller: 'users', action: 'new', as: 'new_user'
  post '/users', controller: 'users', action: 'create', as: 'users'

  # READ
  get '/users', controller: 'users', action: 'index'
  get '/users/:id', controller: 'users', action: 'show', as: 'user'

  # UPDATE
  get '/users/:id/edit', controller: 'users', action: 'edit', as: 'edit_user'
  patch '/users/:id', controller: 'users', action: 'update'

  # DELETE
  delete '/users/:id', controller: 'users', action: 'destroy'
  #------------------------------

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
