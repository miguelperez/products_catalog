class Admin::UserSessionsController < ApplicationController
  before_filter :require_login, :only => [:destroy] 
  layout 'login'
  
  def new
    redirect_to dashboard_url if current_user
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in"
      redirect_to dashboard_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logout"
    redirect_to login_url
  end
end
