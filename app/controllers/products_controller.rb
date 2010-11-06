class ProductsController < ApplicationController

  before_filter :fetch_product
  before_filter :store_visited_product, :only => [:show]

  def index
    @products = Product.visible
    @categories = Category.all
  end

  def show
    @categories = Category.all
  end

  #fetches the product referenced by the id.
  def fetch_product
    @product = Product.visible.find(params[:id]) if params[:id]
  end

  #creates a cookie that will store the products this user viewed.
  def store_visited_product
    id = @product.id
    unless cookies[:user_visited_products]
      cookies[:user_visited_products] = id
    else
      cookies_array = cookies[:user_visited_products].to_s.split(',')
      if cookies_array.size < 20
        cookies_array << id unless cookies_array.include?("#{id}")
        cookies[:user_visited_products] = cookies_array.join(",")
      end
    end
  end
end
