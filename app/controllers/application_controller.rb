# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user, :current_user_session
  before_filter :set_session
  before_filter :set_user   # to make @user available to all controllers


  private

  def index
    @user_session = UserSession.new
    @index = true
  end

  def set_session
    if current_user_session
      @user_session = current_user_session
    else
      @user_session = UserSession.new
    end
  end

  def set_user
    @user = current_user
  end


  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      store_location
      #   redirect_to new_user_session_url
      redirect_to("/")
      #if not flash[:notice]    #<-- How to check if an array or dictionary has an element
      flash[:notice] = "You must be logged in to access this page"
      #end
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

end

