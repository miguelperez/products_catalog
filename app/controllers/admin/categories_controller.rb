class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all  
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Successfully Created"
      redirect_to new_admin_category_url
    else
      render :action => 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Successfully updated"
      redirect_to admin_categories_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
  end

end
