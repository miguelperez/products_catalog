ActionController::Routing::Routes.draw do |map|
  
  map.namespace :admin do |admin|
    admin.resources :users, :only => [:edit, :update, :show]
  end

  map.root :controller => "pages"
end
#== Route Map
# Generated on 30 Sep 2010 22:36
#
# edit_admin_user GET /admin/users/:id/edit(.:format) {:action=>"edit", :controller=>"admin/users"}
#      admin_user GET /admin/users/:id(.:format)      {:action=>"show", :controller=>"admin/users"}
#                 PUT /admin/users/:id(.:format)      {:action=>"update", :controller=>"admin/users"}
#            root     /                               {:action=>"index", :controller=>"pages"}
# Loaded suite /usr/bin/rake
# Started
# 
# Finished in 0.000161 seconds.
# 
# 0 tests, 0 assertions, 0 failures, 0 errors
