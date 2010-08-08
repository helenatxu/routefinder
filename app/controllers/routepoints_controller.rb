class RoutepointsController < ApplicationController


  def new
    @routepoint = Routepoint.new
  end
  
  def create
    @routepoint = Routepoint.new(params[:routepoint])
    @routepoint.place = @place
    @routepoint.order = 3
    if @routepoint.save
      redirect_to place_path(@routepoint[:place_id]), :notice => 'Place added to route.'
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
