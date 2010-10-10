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
  map.resources :categories, :only => [:show]
  map.resources :contact, :only => [:index, :create]

  map.root :controller => "pages"
end
#== Route Map
# Generated on 10 Oct 2010 12:18
#
#                  login        /login                               {:controller=>"admin/user_sessions", :action=>"new"}
#                 logout        /logout                              {:controller=>"admin/user_sessions", :action=>"destroy"}
#        edit_admin_user GET    /admin/users/:id/edit(.:format)      {:controller=>"admin/users", :action=>"edit"}
#             admin_user GET    /admin/users/:id(.:format)           {:controller=>"admin/users", :action=>"show"}
#                        PUT    /admin/users/:id(.:format)           {:controller=>"admin/users", :action=>"update"}
#    admin_user_sessions POST   /admin/user_sessions(.:format)       {:controller=>"admin/user_sessions", :action=>"create"}
# new_admin_user_session GET    /admin/user_sessions/new(.:format)   {:controller=>"admin/user_sessions", :action=>"new"}
#     admin_user_session DELETE /admin/user_sessions/:id(.:format)   {:controller=>"admin/user_sessions", :action=>"destroy"}
#       admin_categories GET    /admin/categories(.:format)          {:controller=>"admin/categories", :action=>"index"}
#                        POST   /admin/categories(.:format)          {:controller=>"admin/categories", :action=>"create"}
#     new_admin_category GET    /admin/categories/new(.:format)      {:controller=>"admin/categories", :action=>"new"}
#    edit_admin_category GET    /admin/categories/:id/edit(.:format) {:controller=>"admin/categories", :action=>"edit"}
#         admin_category GET    /admin/categories/:id(.:format)      {:controller=>"admin/categories", :action=>"show"}
#                        PUT    /admin/categories/:id(.:format)      {:controller=>"admin/categories", :action=>"update"}
#                        DELETE /admin/categories/:id(.:format)      {:controller=>"admin/categories", :action=>"destroy"}
#         admin_products GET    /admin/products(.:format)            {:controller=>"admin/products", :action=>"index"}
#                        POST   /admin/products(.:format)            {:controller=>"admin/products", :action=>"create"}
#      new_admin_product GET    /admin/products/new(.:format)        {:controller=>"admin/products", :action=>"new"}
#     edit_admin_product GET    /admin/products/:id/edit(.:format)   {:controller=>"admin/products", :action=>"edit"}
#          admin_product GET    /admin/products/:id(.:format)        {:controller=>"admin/products", :action=>"show"}
#                        PUT    /admin/products/:id(.:format)        {:controller=>"admin/products", :action=>"update"}
#                        DELETE /admin/products/:id(.:format)        {:controller=>"admin/products", :action=>"destroy"}
#              dashboard        /admin/dashboard                     {:controller=>"admin/dashboard", :action=>"index"}
#               products GET    /products(.:format)                  {:controller=>"products", :action=>"index"}
#                product GET    /products/:id(.:format)              {:controller=>"products", :action=>"show"}
#               category GET    /categories/:id(.:format)            {:controller=>"categories", :action=>"show"}
#          contact_index GET    /contact(.:format)                   {:controller=>"contact", :action=>"index"}
#                        POST   /contact(.:format)                   {:controller=>"contact", :action=>"create"}
#                   root        /                                    {:controller=>"pages", :action=>"index"}
# Loaded suite /usr/bin/rake
# Started
# 
# Finished in 0.000289 seconds.
# 
# 0 tests, 0 assertions, 0 failures, 0 errors
