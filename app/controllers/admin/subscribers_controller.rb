class Admin::SubscribersController < ApplicationController
  before_filter :require_login
  layout 'admin'
  
  def index
    @subscribers = Subscriber.paginate :page => params[:page], :order => 'created_at DESC'
  end
  
  def new
    @subscriber = Subscriber.new
  end
  
  def create
    @subscriber = Subscriber.new(params[:subscriber])
    if @subscriber.save
      notice('created', Subscriber.human_name)
      redirect_to admin_subscribers_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy
    redirect_to admin_subscribers_url
  end
end
