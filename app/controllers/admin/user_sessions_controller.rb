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
      notice('logged_in')
      redirect_to dashboard_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    notice('logout')
    redirect_to login_url
  end
end
