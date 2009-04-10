ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  
  map.resources :pages, 
    :collection => { :show_by_title => :get }
  map.resource :home
  
  map.home '', :controller => 'home', :action => 'show'
  map.seo ':seo_title', :controller => 'pages', :action => 'show_by_seo_title'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
