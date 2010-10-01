class Admin::UsersController < ApplicationController
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "EDITADO>>> BUSCAR I18N"
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
end
