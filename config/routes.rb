Rails.application.routes.draw do

  resources :ticket_details, :viewings, :ticket_purchases, :auditoriums, :movies

  root to: "movies#show"

  # get 'ticket_details/index'
  #
  # get 'ticket_details/show'
  #
  # get 'viewings/index'
  #
  # get 'viewings/create'
  #
  # get 'viewings/new'
  #
  # get 'viewings/edit'
  #
  # get 'viewings/show'
  #
  # get 'viewings/update'
  #
  # get 'viewings/destroy'
  #
  # get 'ticket_purchases/index'
  #
  # get 'ticket_purchases/show'

  # get 'auditoriums/index'
  #
  # get 'auditoriums/create'
  #
  # get 'auditoriums/new'
  #
  # get 'auditoriums/edit'
  #
  # get 'auditoriums/show'
  #
  # get 'auditoriums/update'
  #
  # get 'auditoriums/destroy'
  #
  # get 'movies/index'
  #
  # get 'movies/create'
  #
  # get 'movies/new'
  #
  # get 'movies/edit'
  #
  # get 'movies/show'
  #
  # get 'movies/update'
  #
  # get 'movies/destroy'

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
