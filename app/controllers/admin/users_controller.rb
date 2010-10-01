class Admin::UsersController < ApplicationController
  before_filter :require_login
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "EDITADO>>> BUSCAR I18N"
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
  
  def show
    @user = current_user
  end
end
