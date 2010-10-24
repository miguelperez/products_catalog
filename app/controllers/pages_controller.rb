class PagesController < ApplicationController
  layout "site"
  
  #renders the index page.
  def index
    @products = Product.visible(:include => :category)
    @categories = @products.map(&:category)
  end
end
