ActionController::Routing::Routes.draw do |map|
  map.login "login", :controller => "admin/user_sessions", :action => "new"
  map.logout "logout", :controller => "admin/user_sessions", :action => "destroy"
  
  map.namespace :admin do |admin|
    admin.resources :users, :only => [:edit, :update, :show]
    admin.resources :user_sessions, :only => [:new, :create, :destroy]
  end

  map.root :controller => "pages"
end
#== Route Map
# Generated on 01 Oct 2010 13:31
#
#                  login        /login                             {:action=>"new", :controller=>"admin/user_sessions"}
#                 logout        /logout                            {:action=>"destroy", :controller=>"admin/user_sessions"}
#        edit_admin_user GET    /admin/users/:id/edit(.:format)    {:action=>"edit", :controller=>"admin/users"}
#             admin_user GET    /admin/users/:id(.:format)         {:action=>"show", :controller=>"admin/users"}
#                        PUT    /admin/users/:id(.:format)         {:action=>"update", :controller=>"admin/users"}
#    admin_user_sessions POST   /admin/user_sessions(.:format)     {:action=>"create", :controller=>"admin/user_sessions"}
# new_admin_user_session GET    /admin/user_sessions/new(.:format) {:action=>"new", :controller=>"admin/user_sessions"}
#     admin_user_session DELETE /admin/user_sessions/:id(.:format) {:action=>"destroy", :controller=>"admin/user_sessions"}
#                   root        /                                  {:action=>"index", :controller=>"pages"}
# Loaded suite /usr/bin/rake
# Started
# 
# Finished in 0.000225 seconds.
# 
# 0 tests, 0 assertions, 0 failures, 0 errors
