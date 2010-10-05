ActionController::Routing::Routes.draw do |map|
  map.login "login", :controller => "admin/user_sessions", :action => "new"
  map.logout "logout", :controller => "admin/user_sessions", :action => "destroy"
  
  map.namespace :admin do |admin|
    admin.resources :users, :only => [:edit, :update, :show]
    admin.resources :user_sessions, :only => [:new, :create, :destroy]
    admin.resources :categories
    map.dashboard "admin/dashboard", :controller => "admin/dashboard", :action => "index"
  end

  map.root :controller => "pages"
end
#== Route Map
# Generated on 04 Oct 2010 21:55
#
#                  login        /login                               {:action=>"new", :controller=>"admin/user_sessions"}
#                 logout        /logout                              {:action=>"destroy", :controller=>"admin/user_sessions"}
#        edit_admin_user GET    /admin/users/:id/edit(.:format)      {:action=>"edit", :controller=>"admin/users"}
#             admin_user GET    /admin/users/:id(.:format)           {:action=>"show", :controller=>"admin/users"}
#                        PUT    /admin/users/:id(.:format)           {:action=>"update", :controller=>"admin/users"}
#    admin_user_sessions POST   /admin/user_sessions(.:format)       {:action=>"create", :controller=>"admin/user_sessions"}
# new_admin_user_session GET    /admin/user_sessions/new(.:format)   {:action=>"new", :controller=>"admin/user_sessions"}
#     admin_user_session DELETE /admin/user_sessions/:id(.:format)   {:action=>"destroy", :controller=>"admin/user_sessions"}
#       admin_categories GET    /admin/categories(.:format)          {:action=>"index", :controller=>"admin/categories"}
#                        POST   /admin/categories(.:format)          {:action=>"create", :controller=>"admin/categories"}
#     new_admin_category GET    /admin/categories/new(.:format)      {:action=>"new", :controller=>"admin/categories"}
#    edit_admin_category GET    /admin/categories/:id/edit(.:format) {:action=>"edit", :controller=>"admin/categories"}
#         admin_category GET    /admin/categories/:id(.:format)      {:action=>"show", :controller=>"admin/categories"}
#                        PUT    /admin/categories/:id(.:format)      {:action=>"update", :controller=>"admin/categories"}
#                        DELETE /admin/categories/:id(.:format)      {:action=>"destroy", :controller=>"admin/categories"}
#              dashboard        /admin/dashboard                     {:action=>"index", :controller=>"admin/dashboard"}
#                   root        /                                    {:action=>"index", :controller=>"pages"}
# Loaded suite /usr/bin/rake
# Started
# 
# Finished in 0.000246 seconds.
# 
# 0 tests, 0 assertions, 0 failures, 0 errors
