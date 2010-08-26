class RoutepointsController < ApplicationController


  def new
    @routepoint = Routepoint.new
  end
  
  def create
    @routepoint = Routepoint.new(params[:routepoint])
#    logger.debug Routepoint.maximum(:order, :conditions => ["route_id = ?", params[:routepoint][:route_id]])
    maxorder = Routepoint.find_by_sql(['SELECT MAX("order") AS maxorder FROM routepoints WHERE route_id=?', params[:routepoint][:route_id]])[0].maxorder.to_i
    @routepoint.order = maxorder + 1
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
    redirect_to route_path(@routepoint[:route_id]), :notice => 'Place deleted.'
  end
end
