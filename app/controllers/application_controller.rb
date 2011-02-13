#  Filters added to this controller apply to all controllers in the application.
#  Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all #  include all helpers, all the time
  protect_from_forgery #  See ActionController::RequestForgeryProtection for details
  layout :layout
  

  before_filter :store_location
  before_filter :set_locale
  before_filter :set_display_option
  filter_parameter_logging :password

  helper_method :current_user

  # Adds a message to the flash[:notice] hash.
  def notice(message, model = nil)
    case message
    when /updated/i
      message = t('messages.successful_update', :model => model)
    when /created/i
      message = t('messages.successful_create', :model => model)
    when /logged_in/i
      message = t('messages.successful_logged_in')
    when /logout/i
      message = t('messages.successful_logout')
    when /subscribed/i
      message = t('messages.successful_subscription')
    end
    flash[:notice] = message
  end

  # Adds an error message to the flash hash.
  def error(message)
    case message
    when /no_update/i
      message = t('messages.error', :confirmation => t('messages.no_update_confirmation'), :check_again => t('messages.check_again'), :try_again => t('messages.try_again'))
    when /no_create/i
      message = t('messages.error', :confirmation => t('messages.no_create_confirmation'), :check_again => t('messages.check_again'), :try_again => t('messages.try_again'))
    end
    flash[:error] = message
  end


  private

  # Sets the locale for the application. If the users is signed in it will get the user language
  # and saves it to a cookie, this way next time it will check for the cookies value instead
  # of querying the database again.
  def set_locale
    if cookies[:locale].blank? || params[:locale]
      if params[:locale]
        I18n.locale = cookies[:locale] = params[:locale]
      else
        I18n.locale = cookies[:locale] = CATALOG_CONFS['site']['default_locale']
      end
      # if not defined in params, the locale will be the default one defined in the environment.rb file
    else
      I18n.locale = cookies[:locale]
    end
  end
  
  # Sets the default display option for products. It can be grid or list.
  def set_display_option
    if cookies[:display_option].blank? || params[:display_option]
      if params[:display_option]
        cookies[:display_option] = params[:display_option]
      else
        cookies[:display_option] = CATALOG_CONFS['site']['default_display_option']
      end
    end
  end

  # Checks that there is a User logged in. Otherwise it will redirect him to the login_url
  def require_login
    unless current_user
      store_location
      flash[:notice] = t("messages.you_must_login")
      redirect_to login_url
      return false
    end
  end

  # Returns the current user sersion
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  # returns the current user
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  # Saves the page the user is trying to view
  def store_location
    session[:return_to] = request.request_uri
  end

  # Returns the previous page the user tried to visit or the root page (if the previous one is not defined)
  def previous_page_or_root
    session[:return_to] || root_url
  end
  
  private
  
  def layout
    return session[:layout] if session[:layout]
    session[:layout] = File.exists?(File.join(RAILS_ROOT, "app", "views", "layouts", "site.html.erb")) ? 'site' : 'default'
  end
end
