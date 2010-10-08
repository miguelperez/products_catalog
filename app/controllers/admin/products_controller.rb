class Admin::ProductsController < ApplicationController
  before_filter :require_login
  layout 'admin'
  
  def index
    @products = Product.all  
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = "Successfully Created"
      redirect_to new_admin_product_url
    else
      render :action => 'new'
    end
  end
  
  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:notice] = "Successfully Updated"
      redirect_to admin_products_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_url
  end
end
