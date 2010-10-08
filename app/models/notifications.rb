class Notifications < ActionMailer::Base
  
  #sends a contact us email
  def contact(email_params)
    subject       "Contact form"
    recipients    CATALOG_CONFS['company']['contact_email'] #who will receive the email
    from          CATALOG_CONFS['company']['no_reply_email'] #who will send the email
    sent_on       Time.now.utc
    content_type  "text/html"
  
    body :attributes => email_params
  end

end
