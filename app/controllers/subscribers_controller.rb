class SubscribersController < ApplicationController
  skip_before_filter :store_location
  
  def new
    @subscriber = Subscriber.new
  end
  
  def create
    @subscriber = Subscriber.new(params[:subscriber])
    if @subscriber.save
      flash[:notice] = "Successfully Subscribed"
      redirect_to previous_page_or_root
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy
    redirect_to previous_page_or_root
  end
end
