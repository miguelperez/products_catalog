class Admin::CategoriesController < ApplicationController
  before_filter :require_login
  layout 'admin'
  
  def index
    @categories = Category.all  
  end
  
  def new
    @category = Category.new
    @categories = Category.all - [@category]
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Successfully Created"
      redirect_to new_admin_category_url
    else
      @categories = Category.all - [@category]
      render :action => 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.all - [@category]
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Successfully Updated"
      redirect_to admin_categories_url
    else
      @categories = Category.all - [@category]
      render :action => 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    unless @category.destroy
      flash[:error] = @category.errors.full_messages.to_sentence
    end
    redirect_to admin_categories_url
  end

end
