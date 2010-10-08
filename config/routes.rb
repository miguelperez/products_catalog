ActionController::Routing::Routes.draw do |map|
  map.login "login", :controller => "admin/user_sessions", :action => "new"
  map.logout "logout", :controller => "admin/user_sessions", :action => "destroy"
  
  map.namespace :admin do |admin|
    admin.resources :users, :only => [:edit, :update, :show]
    admin.resources :user_sessions, :only => [:new, :create, :destroy]
    admin.resources :categories
    admin.resources :products
    map.dashboard "admin/dashboard", :controller => "admin/dashboard", :action => "index"
  end
  
  map.resources :products, :only => [:index, :show]

  map.root :controller => "pages"
end
#== Route Map
# Generated on 07 Oct 2010 19:55
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
#         admin_products GET    /admin/products(.:format)            {:action=>"index", :controller=>"admin/products"}
#                        POST   /admin/products(.:format)            {:action=>"create", :controller=>"admin/products"}
#      new_admin_product GET    /admin/products/new(.:format)        {:action=>"new", :controller=>"admin/products"}
#     edit_admin_product GET    /admin/products/:id/edit(.:format)   {:action=>"edit", :controller=>"admin/products"}
#          admin_product GET    /admin/products/:id(.:format)        {:action=>"show", :controller=>"admin/products"}
#                        PUT    /admin/products/:id(.:format)        {:action=>"update", :controller=>"admin/products"}
#                        DELETE /admin/products/:id(.:format)        {:action=>"destroy", :controller=>"admin/products"}
#              dashboard        /admin/dashboard                     {:action=>"index", :controller=>"admin/dashboard"}
#               products GET    /products(.:format)                  {:action=>"index", :controller=>"products"}
#                product GET    /products/:id(.:format)              {:action=>"show", :controller=>"products"}
#                   root        /                                    {:action=>"index", :controller=>"pages"}
# Loaded suite /usr/bin/rake
# Started
# 
# Finished in 0.000314 seconds.
# 
# 0 tests, 0 assertions, 0 failures, 0 errors
