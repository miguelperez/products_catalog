class SubscribersController < ApplicationController
  skip_before_filter :store_location
  
  def new
    @subscriber = Subscriber.new
  end
  
  def create
    @subscriber = Subscriber.new(params[:subscriber])
    if @subscriber.save
      notice('subscribed')
    else
      flash[:notice] = @subscriber.errors.full_messages.to_sentence
    end
    flash.keep
    redirect_to previous_page_or_root
  end
  
  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy
    redirect_to previous_page_or_root
  end
end
