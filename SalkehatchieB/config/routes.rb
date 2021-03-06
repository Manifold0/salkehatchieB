SalkehatchieB::Application.routes.draw do
  
  resources :payments, only: [:new,:index,:show, :create]
  

  resources :camps, only: [:index, :show], param: :campid #delete will redirect!
  get 'camps/:campid/campers' => "users#campers" , as: :camps_campers
  get 'camps/:campid/forms' => "camps#forms" , as: :camps_forms
  get 'camps/:campid/home' => "camps#home"

  scope 'camps/:campid' do
    resources :sites
  end

  get 'camps/:campid/queries' => "queries#index_for_directors", as: :directors_queries
  scope 'camps/:campid/queries' do
    get 'MissingInsuranceCards' => "queries#missing_insurance_cards", as: :director_query_missing_insurance_cards
    get 'TShirtSizes' => "queries#tshirt_sizes", as: :camp_tshirt_sizes
  end

  resources :schedules

  resources :events

  get 'forms' => "users#forms", as: :forms
  scope 'forms' do
    resources :covenant_forms
    resources :reference_forms
    get 'references/:id/approve' => 'reference_forms#approve', as: :approve_reference
    resources :camp_permission_forms
    resources :medical_forms
    resources :questionnaires
  end

  scope 'camps/:campid/forms' do
    resources :reference_forms, as: :camps_reference_forms
  end

  resources :users, only: [:show, :edit, :update]

  scope 'admin' do
    resources :camps, param: :campid
    as resources :camps do
      get 'camps/' => "camps#index", :as => :admin_camps
      get 'camps/:campid' => "camps#show", as: :admin_camp
      delete 'camps/:campid' => "camps#delete", as: :admin_camp_delete
    end
    resources :users
    as resources :users do
      delete 'users/:id' => "users#delete", as: :admin_user_delete
    end
    get 'directors' => "users#directors", as: :directors
    post 'users/search' => "users#search", as: :users_search

    resources :camp_requests
    post 'camp_request/' => 'camp_requests#create', :as => :admin_request_camps_create
    patch 'camp_request/:id' => 'camp_requests#update', :as => :request_camps_update
    get 'camp_request/assign' => "camp_requests#assign", as: :camp_request_assign
    resources :camp_assignments
    post 'camp_assignments' => 'camp_assignments#create', :as => :assignment_camps_create
    patch 'camp_assignment/:id' => 'camp_assignments#update', :as => :assignment_camps_update
    resources :payments
    as :payments do
      get 'payments' => 'payments#index', :as => :admin_payments
      get 'payments/:id' => 'payments#show', :as => :admin_payments_show
      delete 'payments/:id' => 'payments#delete', :as => :admin_payments_delete
    end
    resources :costs
    get 'cost/approve' => "costs#approve", as: :cost_approve

    #queries
    get 'queries' => "queries#index", as: :queries
    scope 'queries' do
      get 'ByCamp' => "queries#campers_by_camp", as: :query_campers_by_camp
      get 'NotPaid' => "queries#campers_not_paid", as: :query_campers_not_paid
      get 'BackgroundChecks' => "queries#background_checks", as: :query_background_checks
      get 'TshirtSizes' => "queries#tshirt_sizes", as: :query_tshirt_sizes
    end
  end

  get '/request' => 'camp_requests#new', :as => :request_camps
  post '/request' => 'camp_requests#create', :as => :request_camps_create

  get '/', to: redirect('/signin')

  root 'devise/session#new'


  devise_for :users, :skip => [:sessions,:registrations]
  as :user do
    get 'apply' => 'devise/registrations#new', :as => :new_user_registration
    post 'apply' => 'devise/registrations#create', :as => :user_registration
    get 'signin' => 'devise/sessions#new', :as => :new_user_session
    get 'basicinfo' => 'users#edit', as: :user_basic_info
    post 'signin.user' => 'devise/sessions#create', :as => :user_session
    match 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session,
    :via => Devise.mappings[:user].sign_out_via
  end

  resources :photos
  

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
