Rails.application.routes.draw do
  
  get 'static_pages/home'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'welcome/index'

  get 'search' =>  "static_pages#search"
  get 'option-radar' =>  "static_pages#option-radar"
  get 'what-is-optioncast' =>  "static_pages#what-is-optioncast"
  get 'pricing' =>  "static_pages#pricing"

  get 'implied-volatility-change' =>  "static_pages#implied-volatility-change"
  get 'straddle-change' =>  "static_pages#straddle-change"
  get 'open-interest-change' =>  "static_pages#open-interest-change"
  get 'option-volume-change' =>  "static_pages#option-volume-change"
  get 'put-call-ratios' =>  "static_pages#put-call-ratios"

  get 'implied-volaility-sentiment' =>  "static_pages#implied-volaility-sentiment"
  get 'straddle-sentiment' =>  "static_pages#straddle-sentiment"
  get 'implied-volatility-percentiles' =>  "static_pages#implied-volatility-percentiles"
  get 'straddle-percentiles' =>  "static_pages#straddle-percentiles"
  get 'implied-volatility-average' =>  "static_pages#implied-volatility-average"
  get 'straddle-average' =>  "static_pages#straddle-average"

  get 'open-interest-strike' =>  "static_pages#open-interest-strike"
  get 'open-interest-chart' =>  "static_pages#open-interest-chart"

  get 'implied-volatility-chart' =>  "static_pages#implied-volatility-chart"
  get 'straddle-chart' =>  "static_pages#straddle-chart"
  get 'option-montage' =>  "static_pages#option-montage"

  get 'straddle-averages' =>  "static_pages#straddle-averages"
  get 'real-time-option-trades' =>  "static_pages#real-time-option-trades"
  get 'earnings-dates' =>  "static_pages#earnings-dates"
  get 'earnings-results' =>  "static_pages#earnings-results"
  get 'option-radar' =>  "static_pages#option-radar"
  get 'faq' =>  "static_pages#faq"
  get 'myaccount' =>  "static_pages#myaccount"
  get 'broker-reviews' =>  "static_pages#broker-reviews"
  get 'trading-deals' =>  "static_pages#trading-deals"

  get 'high-option-volume' =>  "static_pages#high-option-volume"
  get 'high-open-interest' =>  "static_pages#high-open-interest"
  get 'overpriced-straddle' =>  "static_pages#overpriced-straddle"
  get 'underpriced-straddle' =>  "static_pages#underpriced-straddle"
  get 'overpriced-implied-volatility' =>  "static_pages#overpriced-implied-volatility"
  get 'underpriced-implied-volatility' =>  "static_pages#underpriced-implied-volatility"
  get 'call-volume-change' =>  "static_pages#call-volume-change"
  get 'put-volume-change' =>  "static_pages#put-volume-change"
  get 'call-open-interest' =>  "static_pages#call-open-interest"
  get 'put-open-interest' =>  "static_pages#put-open-interest"
  get 'call-open-interest-strike' =>  "static_pages#call-open-interest-strike"
  get 'put-open-interest-strike' =>  "static_pages#put-open-interest-strike"
  get 'put-call-ratio' =>  "static_pages#put-call-ratio"
  get 'call-put-ratio' =>  "static_pages#call-put-ratio"
  get 'increasing-implied-volatility' =>  "static_pages#increasing-implied-volatility"
  get 'decreasing-implied-volatility' =>  "static_pages#decreasing-implied-volatility"
  get 'increasing-straddle' =>  "static_pages#increasing-straddle"
  get 'decreasing-straddle' =>  "static_pages#decreasing-straddle"

  get 'pro-sign-up' =>  "static_pages#pro-sign-up"
  get 'free_sign_up' =>  "static_pages#free_sign_up"

  get 'aapl' =>  "static_pages#aapl"
  get 'about' => "static_pages#about"
  get 'contact' => "static_pages#contact"

  #devise_for :users
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions', users:'users' }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'  
    get '/users/questionnaire' => 'users#questionnaire'
    post '/users/submit' => 'users#submit'
    post '/users' => 'registrations#create'
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
