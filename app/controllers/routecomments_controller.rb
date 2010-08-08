class RoutecommentsController < ApplicationController
  
  # GET /routecomments
  def index
    @routecomments = Routecomment.find(:all, :conditions => ['route_id = ?', params[:id]])
 #   @users_comments = User.find(:all, :conditions => ['(user.id = routecomment.user_id'])
        
  end

  # GET /routecomments/new
  def new
    @routecomment = Routecomment.new
  end

  # GET /routecomments/1/edit
  def edit
    @routecomment = Routecomment.find(params[:id])
  end




  # POST /routecomments
  def create
    @routecomment = Routecomment.new(params[:routecomment])
    @routecomment.user = @current_user
    @routecomment[:date] = Time.now
    if @routecomment.save
      redirect_to route_path(@routecomment[:route_id]), :notice => 'Your comment was added.'
    else
      render :action => "new" 
    end
  end


  # PUT /routecomments/1
  def update
    @routecomment = Routecomment.find(params[:id])
    if @routecomment.update_attributes(params[:routecomment])
      redirect_to(@routecomment, :notice => 'Your comment was updated.') 
    else
      render :action => "edit" 

    end
  end


  # DELETE /routecomments/1
  def destroy
    @routecomment = Routecomment.find(params[:id])
    @routecomment.destroy
    redirect_to(routecomments_url) 
  end
  
end
