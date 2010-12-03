class Admin::BannersController < ApplicationController
  before_filter :require_login
  layout 'admin'
  
  def index
    @banners = Banner.all.paginate :page => params[:page], :order => 'created_at DESC'
  end
  
  def new
    @banner = Banner.new
  end
  
  def create
    @banner = Banner.new(params[:banner])
    if @banner.save
      notice('created', Banner.human_name)
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
      notice('updated', Banner.human_name)
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
