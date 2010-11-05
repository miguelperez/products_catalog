class SubscribersController < ApplicationController
  
  def new
    @subscriber = Subscriber.new
  end
  
  def create
    @subscriber = Subscriber.new(params[:subscriber])
    if @subscriber.save
      flash[:notice] = "Successfully Subscribed"
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy
    redirect_to root_url
  end
end
