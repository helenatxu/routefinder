# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password


 # before_filter :login_required, :only=>['welcome', 'change_password', 'hidden']

  def signup
    @user = User.new(@params[:user])
    if request.post?  
      if @user.save
        session[:user] = User.authenticate(@user.username, @user.password)
        flash[:message] = "Signup successful"
        redirect_to :action => "new"          
      else
        flash[:warning] = "Signup unsuccessful"
      end
    end
  end

  def login
    #if request.post?
      if session[:user] = User.authenticate(params[:username], params[:password])
        flash[:message] = "Login successful"
        # redirect_to_stored
      else
        flash[:message] = "Login unsuccessful | Invalid user/password combination"
      end
      redirect_to :controller => 'places', :action => 'index'
    #end
  end

  def logout
    session[:user] = nil
    flash[:message] = 'Logged out'
    redirect_to :action => 'login'
  end


  def login_required
    if session[:user]
      return true
    end
    flash[:warning]='Please login to continue'
    session[:return_to]=request.request_uri
    redirect_to :controller => "user", :action => "login"
    return false 
  end

  def current_user
    session[:user]
  end

  def redirect_to_stored
    if return_to = session[:return_to]
      session[:return_to]=nil
      redirect_to_url(return_to)
    else
      redirect_to :controller=>'user', :action=>'welcome'
    end
  end



end
