class Admin::UserSessionsController < ApplicationController
  before_filter :require_login, :only => [:destroy] 
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Loggeado>>> BUSCAR I18N"
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "DESLOGGEADO>>> BUSCAR I18N"
    redirect_to login_url
  end
end
