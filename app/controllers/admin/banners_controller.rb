class Admin::BannersController < ApplicationController
  before_filter :require_login
  layout 'admin'
  
  def index
    @banners = Banner.all  
  end
  
  def new
    @banner = Banner.new
  end
  
  def create
    @banner = Banner.new(params[:banner])
    if @banner.save
      flash[:notice] = "Successfully Created"
      redirect_to new_admin_banner_url
    else
      render :action => 'new'
    end
  end
  
  def show
    @banner = Banner.find(params[:id])
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def update
    @banner = Banner.find(params[:id])
    if @banner.update_attributes(params[:banner])
      flash[:notice] = "Successfully Updated"
      redirect_to admin_banners_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy
    redirect_to admin_banners_url
  end
end
