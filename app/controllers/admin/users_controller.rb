class Admin::UsersController < ApplicationController
  before_filter :require_login
  layout 'admin'
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated"
      redirect_to edit_admin_user_url
    else
      render :action => 'edit'
    end
  end
  
  def show
    @user = current_user
  end
end
