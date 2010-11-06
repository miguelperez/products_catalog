ActionController::Routing::Routes.draw do |map|
  map.login "login", :controller => "admin/user_sessions", :action => "new"
  map.logout "logout", :controller => "admin/user_sessions", :action => "destroy"
  
  map.namespace :admin do |admin|
    admin.resources :users, :only => [:edit, :update, :show]
    admin.resources :user_sessions, :only => [:new, :create, :destroy]
    admin.resources :categories
    admin.resources :products
    admin.resources :banners
    admin.resources :subscribers
    map.dashboard "admin/dashboard", :controller => "admin/dashboard", :action => "index"
  end
  
  map.resources :products, :only => [:index, :show]
  map.resources :subscribers, :only => [:new, :create, :destroy]
  map.resources :categories, :only => [:show]
  map.resources :contact, :only => [:index, :create]

  map.root :controller => "pages"
end
#== Route Map
# Generated on 06 Nov 2010 15:59
#
#                  login        /login                                {:controller=>"admin/user_sessions", :action=>"new"}
#                 logout        /logout                               {:controller=>"admin/user_sessions", :action=>"destroy"}
#        edit_admin_user GET    /admin/users/:id/edit(.:format)       {:controller=>"admin/users", :action=>"edit"}
#             admin_user GET    /admin/users/:id(.:format)            {:controller=>"admin/users", :action=>"show"}
#                        PUT    /admin/users/:id(.:format)            {:controller=>"admin/users", :action=>"update"}
#    admin_user_sessions POST   /admin/user_sessions(.:format)        {:controller=>"admin/user_sessions", :action=>"create"}
# new_admin_user_session GET    /admin/user_sessions/new(.:format)    {:controller=>"admin/user_sessions", :action=>"new"}
#     admin_user_session DELETE /admin/user_sessions/:id(.:format)    {:controller=>"admin/user_sessions", :action=>"destroy"}
#       admin_categories GET    /admin/categories(.:format)           {:controller=>"admin/categories", :action=>"index"}
#                        POST   /admin/categories(.:format)           {:controller=>"admin/categories", :action=>"create"}
#     new_admin_category GET    /admin/categories/new(.:format)       {:controller=>"admin/categories", :action=>"new"}
#    edit_admin_category GET    /admin/categories/:id/edit(.:format)  {:controller=>"admin/categories", :action=>"edit"}
#         admin_category GET    /admin/categories/:id(.:format)       {:controller=>"admin/categories", :action=>"show"}
#                        PUT    /admin/categories/:id(.:format)       {:controller=>"admin/categories", :action=>"update"}
#                        DELETE /admin/categories/:id(.:format)       {:controller=>"admin/categories", :action=>"destroy"}
#         admin_products GET    /admin/products(.:format)             {:controller=>"admin/products", :action=>"index"}
#                        POST   /admin/products(.:format)             {:controller=>"admin/products", :action=>"create"}
#      new_admin_product GET    /admin/products/new(.:format)         {:controller=>"admin/products", :action=>"new"}
#     edit_admin_product GET    /admin/products/:id/edit(.:format)    {:controller=>"admin/products", :action=>"edit"}
#          admin_product GET    /admin/products/:id(.:format)         {:controller=>"admin/products", :action=>"show"}
#                        PUT    /admin/products/:id(.:format)         {:controller=>"admin/products", :action=>"update"}
#                        DELETE /admin/products/:id(.:format)         {:controller=>"admin/products", :action=>"destroy"}
#          admin_banners GET    /admin/banners(.:format)              {:controller=>"admin/banners", :action=>"index"}
#                        POST   /admin/banners(.:format)              {:controller=>"admin/banners", :action=>"create"}
#       new_admin_banner GET    /admin/banners/new(.:format)          {:controller=>"admin/banners", :action=>"new"}
#      edit_admin_banner GET    /admin/banners/:id/edit(.:format)     {:controller=>"admin/banners", :action=>"edit"}
#           admin_banner GET    /admin/banners/:id(.:format)          {:controller=>"admin/banners", :action=>"show"}
#                        PUT    /admin/banners/:id(.:format)          {:controller=>"admin/banners", :action=>"update"}
#                        DELETE /admin/banners/:id(.:format)          {:controller=>"admin/banners", :action=>"destroy"}
#      admin_subscribers GET    /admin/subscribers(.:format)          {:controller=>"admin/subscribers", :action=>"index"}
#                        POST   /admin/subscribers(.:format)          {:controller=>"admin/subscribers", :action=>"create"}
#   new_admin_subscriber GET    /admin/subscribers/new(.:format)      {:controller=>"admin/subscribers", :action=>"new"}
#  edit_admin_subscriber GET    /admin/subscribers/:id/edit(.:format) {:controller=>"admin/subscribers", :action=>"edit"}
#       admin_subscriber GET    /admin/subscribers/:id(.:format)      {:controller=>"admin/subscribers", :action=>"show"}
#                        PUT    /admin/subscribers/:id(.:format)      {:controller=>"admin/subscribers", :action=>"update"}
#                        DELETE /admin/subscribers/:id(.:format)      {:controller=>"admin/subscribers", :action=>"destroy"}
#              dashboard        /admin/dashboard                      {:controller=>"admin/dashboard", :action=>"index"}
#               products GET    /products(.:format)                   {:controller=>"products", :action=>"index"}
#                product GET    /products/:id(.:format)               {:controller=>"products", :action=>"show"}
#            subscribers POST   /subscribers(.:format)                {:controller=>"subscribers", :action=>"create"}
#         new_subscriber GET    /subscribers/new(.:format)            {:controller=>"subscribers", :action=>"new"}
#             subscriber DELETE /subscribers/:id(.:format)            {:controller=>"subscribers", :action=>"destroy"}
#               category GET    /categories/:id(.:format)             {:controller=>"categories", :action=>"show"}
#          contact_index GET    /contact(.:format)                    {:controller=>"contact", :action=>"index"}
#                        POST   /contact(.:format)                    {:controller=>"contact", :action=>"create"}
#                   root        /                                     {:controller=>"pages", :action=>"index"}
# Loaded suite /usr/bin/rake
# Started
# 
# Finished in 0.000217 seconds.
# 
# 0 tests, 0 assertions, 0 failures, 0 errors
