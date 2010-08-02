class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
#  def new
#    @user_session = UserSession.new
#  end
  
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
     redirect_back_or_default "/application/index"
     
  #     redirect_to :controller => 'application', :user_session => params[:user_session]		             
  #    <%= link_to 'Show', @user %>
  #    redirect_to :action => "edit", :id => params[:id] 
  #    redirect_to :controller => 'application', :user_session => params[user_session]
  		          
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
