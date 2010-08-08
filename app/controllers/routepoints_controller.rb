class RoutepointsController < ApplicationController


  def new
    @routepoint = Routepoint.new
  end
  
  def create
    @routepoint = Routepoint.new(params[:routepoint])
    @routepoint.order = 3
    if @routepoint.save
      redirect_to route_path(@routepoint[:route_id]), :notice => 'Place added to route.'
    else
      render :action => "new" 
    end
  end


  # DELETE /routepoints/1
  def destroy
    @routepoint = Routepoint.find(params[:id])
    @routepoint.destroy
    redirect_to(routepoints_url) 
  end
end
