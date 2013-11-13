SalkehatchieB::Application.routes.draw do
  
  resources :camp_assignments

  resources :costs

  resources :payments, only: [:new,:index,:show]

  resources :schedules

  resources :events


  resources :covenant_forms

  resources :reference_forms


  resources :camps, only: :show

  scope 'admin' do
    resources :camps
    resources :users
    resources :camp_requests
    resources :payments
    as :payments do
      get 'payments/:id' => 'payments#show', :as => :admin_payments_show
    end
  end

  resources :camp_requests, only: :new

  get '/', to: redirect('/signin')

  # devise_for :users

  devise_for :users, :skip => [:sessions,:registrations]
  as :user do
    get 'apply' => 'devise/registrations#new', :as => :new_user_registration
    post 'apply' => 'devise/registrations#create', :as => :user_registration
    get 'signin' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    match 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session,
    :via => Devise.mappings[:user].sign_out_via
  end

  resources :sites
  resources :photos
  resources :camp_permission_forms

  resources :medical_forms

  resources :questionnaires

  

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
