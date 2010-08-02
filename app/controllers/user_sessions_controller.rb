class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
     redirect_back_or_default "/application/index"  		          
    else
      flash[:notice] = "Invalid user/password combination"
      redirect_back_or_default "/application/index"
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default "/application/index"
  #      redirect_to :controller => 'application'
  end
end
