Rails.application.routes.draw do
  
  get 'static_pages/home'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'welcome/index'

  match "/blog" => redirect("/blog/"), via: :all

  get 'about' => "static_pages#about"
  get 'contact' => "static_pages#contact"

  get 'recommendations' =>  "dashboard#recommendations"
  get 'charts' =>  "dashboard#charts"
  get 'averages' =>  "dashboard#averages"
  get 'data' =>  "dashboard#data"
  get 'how_to' =>  "dashboard#how_to"

  patch '/dashboard/submit' => 'dashboard#submit'




  #devise_for :users
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions', users:'users' }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'  
    get '/users/questionnaire' => 'users#questionnaire'
    post '/users/submit' => 'users#submit'
    get '/users/guest' => 'registrations#guest_user'

  end

  #devise_scope :user do
  #  authenticated :user do
  #    root :to => 'welcome#index'
  #  end
  #  unauthenticated :user do
  #    root :to => 'devise/registrations#new', as: :unauthenticated_root
  #  end
  #end

  root :to => 'welcome#index'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
