class RoutesController < ApplicationController

  # GET /routes
  def index
    @countries = Country.find(:all)
    if params[:keywords] and not params[:keywords].empty?
      if params[:country_id] and not params[:country_id].empty?
        #   @routes = Route.find(:all, :conditions => ['(routes.name LIKE ? or routes.description LIKE ?) and (places.country = ? and places.id IN routes.places)', "%#{params[:keywords]}%", "%#{params[:keywords]}%", params[:country_id]])
        @routes = Route.find(:all, :conditions => ['(routes.name LIKE ? or routes.description LIKE ? )', "%#{params[:keywords]}%", "%#{params[:keywords]}%"])
      else
        @routes = Route.find(:all, :conditions => ['name LIKE ? or description LIKE ?', "%#{params[:keywords]}%", "%#{params[:keywords]}%"])
      end
    else
      @routes = Route.find(:all)
    end
  end

  # GET /routes/1
  def show
    @route = Route.find(params[:id])
    @routecomments = Routecomment.find(:all, :conditions => ['route_id = ?', params[:id]])
    @newRoutecomment = Routecomment.new
    @route_id = params[:id]
  end

  # GET /routes/new
  def new
    @route = Route.new
  end

  # GET /routes/1/edit
  def edit
    @route = Route.find(params[:id])
  end

  # POST /routes
  def create
    @route = Route.new(params[:route])
    if @route.save
      redirect_to(@route, :notice => 'Route was successfully created.') 
    else
      render :action => "new" 
    end
  end

  # PUT /routes/1
  def update
    @route = Route.find(params[:id])
    if @route.update_attributes(params[:route])
      redirect_to(@route, :notice => 'Route was successfully updated.') 
    else
      render :action => "edit" 
    end
  end

  # DELETE /routes/1
  def destroy
    @route = Route.find(params[:id])
    @route.destroy
    redirect_to(routes_url) 
  end

end
