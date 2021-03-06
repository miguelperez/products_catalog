ActionController::Routing::Routes.draw do |map|
  map.login "login", :controller => "admin/user_sessions", :action => "new"
  map.logout "logout", :controller => "admin/user_sessions", :action => "destroy"
  
  map.admin "admin", :controller => "admin/dashboard", :action => "index"
  map.namespace :admin do |admin|
    admin.resources :users, :only => [:edit, :update, :show]
    admin.resources :user_sessions, :only => [:new, :create, :destroy]
    admin.resources :categories
    admin.resources :products
    admin.resources :banners
    admin.resources :subscribers
    admin.resources :dashboard, :only => [:index]
  end
  
  map.resources :products, :only => [:index, :show]
  map.tags 'products/tags/:tag', :controller => "products", :action => "tags"
  map.resources :subscribers, :only => [:new, :create, :destroy]
  map.resources :categories, :only => [:show]
  map.resources :contact, :only => [:index, :create]

  map.root :controller => "pages"
end
#== Route Map
# Generated on 18 Dec 2010 10:17
#
#                  login        /login                                {:action=>"new", :controller=>"admin/user_sessions"}
#                 logout        /logout                               {:action=>"destroy", :controller=>"admin/user_sessions"}
#                  admin        /admin                                {:action=>"index", :controller=>"admin/dashboard"}
#        edit_admin_user GET    /admin/users/:id/edit(.:format)       {:action=>"edit", :controller=>"admin/users"}
#             admin_user GET    /admin/users/:id(.:format)            {:action=>"show", :controller=>"admin/users"}
#                        PUT    /admin/users/:id(.:format)            {:action=>"update", :controller=>"admin/users"}
#    admin_user_sessions POST   /admin/user_sessions(.:format)        {:action=>"create", :controller=>"admin/user_sessions"}
# new_admin_user_session GET    /admin/user_sessions/new(.:format)    {:action=>"new", :controller=>"admin/user_sessions"}
#     admin_user_session DELETE /admin/user_sessions/:id(.:format)    {:action=>"destroy", :controller=>"admin/user_sessions"}
#       admin_categories GET    /admin/categories(.:format)           {:action=>"index", :controller=>"admin/categories"}
#                        POST   /admin/categories(.:format)           {:action=>"create", :controller=>"admin/categories"}
#     new_admin_category GET    /admin/categories/new(.:format)       {:action=>"new", :controller=>"admin/categories"}
#    edit_admin_category GET    /admin/categories/:id/edit(.:format)  {:action=>"edit", :controller=>"admin/categories"}
#         admin_category GET    /admin/categories/:id(.:format)       {:action=>"show", :controller=>"admin/categories"}
#                        PUT    /admin/categories/:id(.:format)       {:action=>"update", :controller=>"admin/categories"}
#                        DELETE /admin/categories/:id(.:format)       {:action=>"destroy", :controller=>"admin/categories"}
#         admin_products GET    /admin/products(.:format)             {:action=>"index", :controller=>"admin/products"}
#                        POST   /admin/products(.:format)             {:action=>"create", :controller=>"admin/products"}
#      new_admin_product GET    /admin/products/new(.:format)         {:action=>"new", :controller=>"admin/products"}
#     edit_admin_product GET    /admin/products/:id/edit(.:format)    {:action=>"edit", :controller=>"admin/products"}
#          admin_product GET    /admin/products/:id(.:format)         {:action=>"show", :controller=>"admin/products"}
#                        PUT    /admin/products/:id(.:format)         {:action=>"update", :controller=>"admin/products"}
#                        DELETE /admin/products/:id(.:format)         {:action=>"destroy", :controller=>"admin/products"}
#          admin_banners GET    /admin/banners(.:format)              {:action=>"index", :controller=>"admin/banners"}
#                        POST   /admin/banners(.:format)              {:action=>"create", :controller=>"admin/banners"}
#       new_admin_banner GET    /admin/banners/new(.:format)          {:action=>"new", :controller=>"admin/banners"}
#      edit_admin_banner GET    /admin/banners/:id/edit(.:format)     {:action=>"edit", :controller=>"admin/banners"}
#           admin_banner GET    /admin/banners/:id(.:format)          {:action=>"show", :controller=>"admin/banners"}
#                        PUT    /admin/banners/:id(.:format)          {:action=>"update", :controller=>"admin/banners"}
#                        DELETE /admin/banners/:id(.:format)          {:action=>"destroy", :controller=>"admin/banners"}
#      admin_subscribers GET    /admin/subscribers(.:format)          {:action=>"index", :controller=>"admin/subscribers"}
#                        POST   /admin/subscribers(.:format)          {:action=>"create", :controller=>"admin/subscribers"}
#   new_admin_subscriber GET    /admin/subscribers/new(.:format)      {:action=>"new", :controller=>"admin/subscribers"}
#  edit_admin_subscriber GET    /admin/subscribers/:id/edit(.:format) {:action=>"edit", :controller=>"admin/subscribers"}
#       admin_subscriber GET    /admin/subscribers/:id(.:format)      {:action=>"show", :controller=>"admin/subscribers"}
#                        PUT    /admin/subscribers/:id(.:format)      {:action=>"update", :controller=>"admin/subscribers"}
#                        DELETE /admin/subscribers/:id(.:format)      {:action=>"destroy", :controller=>"admin/subscribers"}
#               products GET    /products(.:format)                   {:action=>"index", :controller=>"products"}
#                product GET    /products/:id(.:format)               {:action=>"show", :controller=>"products"}
#                   tags        /products/tags/:tag                   {:action=>"tags", :controller=>"products"}
#            subscribers POST   /subscribers(.:format)                {:action=>"create", :controller=>"subscribers"}
#         new_subscriber GET    /subscribers/new(.:format)            {:action=>"new", :controller=>"subscribers"}
#             subscriber DELETE /subscribers/:id(.:format)            {:action=>"destroy", :controller=>"subscribers"}
#               category GET    /categories/:id(.:format)             {:action=>"show", :controller=>"categories"}
#          contact_index GET    /contact(.:format)                    {:action=>"index", :controller=>"contact"}
#                        POST   /contact(.:format)                    {:action=>"create", :controller=>"contact"}
#                   root        /                                     {:action=>"index", :controller=>"pages"}
# Loaded suite /usr/bin/rake
# Started
# 
# Finished in 0.000174 seconds.
# 
# 0 tests, 0 assertions, 0 failures, 0 errors
