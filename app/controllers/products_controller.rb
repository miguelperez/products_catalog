class ProductsController < ApplicationController
  layout "site"
  def index
    @products = Product.visible
    @categories = Category.all
  end
  
  def show
    @product = Product.visible.find(params[:id])
    @categories = Category.all
  end
end
