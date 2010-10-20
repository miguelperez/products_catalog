class PagesController < ApplicationController
  layout "site"
  
  #renders the index page.
  def index
    @products = Product.all(:include => :category)
    @categories = @products.map(&:category)
  end
end
