Rails.application.routes.draw do

  resources :interventions do
    post :building_select, on: :collection
    post :battery_select, on: :collection
    post :column_select , on: :collection
    post :elevator_select, on: :collection
    # Anciennement pour les call ajax des drop down select.
    #post 'interventionpage/building_select' => 'interventionpage#building_select'
    #post 'interventionpage/battery_select' => 'interventionpage#battery_select'
    #post 'interventionpage/column_select' => 'interventionpage#column_select'
    #post 'interventionpage/elevator_select' => 'interventionpage#elevator_select'
  end  

  resources :places
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Blazer::Engine, at: "blazer"
  
  get '/404' => 'error#404'
  get 'commercial' => 'static_pages#commercial'
  get 'residential' => 'static_pages#residential'
  get 'quote' => 'static_pages#quote'
  # assign root url to index.html.erb located in view sub-folfer 'static_pages'
  get "/" => 'static_pages#index'
  root 'static_pages#index'
  get '/quote_received' => 'static_pages#quote_received'
  get 'gmap' => 'gmap#index'
  get 'dropbox/auth' => 'dropbox#auth'
  get 'dropbox/auth_callback' => 'dropbox#auth_callback'


 

   
  resources :leads, :path => "message"

  get "*path" => redirect("/404")
  end
  