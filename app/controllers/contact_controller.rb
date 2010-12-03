class ContactController < ApplicationController
  
  def index
    
  end
  
  def create
    if Notifications.deliver_contact(params[:contact])
      flash[:notice] = t('messages.email_sent')
      redirect_to(contact_index_path)
    else
      flash[:error] = t('messages.email_not_sent')
      render :index
    end
  end
end
