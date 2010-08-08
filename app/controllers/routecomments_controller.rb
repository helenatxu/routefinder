class RoutecommentsController < ApplicationController
  
  # GET /routecomments
  def index
    @routecomments = Routecomment.find(:all, :conditions => ['route_id = ?', params[:id]])
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
    @routecomment[:user_id] = @current_user[:user_id]
    if @routecomment.save
      redirect_to route_path(@routecomment[:route_id])
      #, :notice => 'Routecomment was successfully created.'
 #    redirect_to(@route, :notice => 'Routecomment was successfully created.')
   #   redirect_back_or_default "/routes/"
    else
      render :action => "new" 
    end
  end


  # PUT /routecomments/1
  def update
    @routecomment = Routecomment.find(params[:id])
    if @routecomment.update_attributes(params[:routecomment])
      redirect_to(@routecomment, :notice => 'Routecomment was successfully updated.') 
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
