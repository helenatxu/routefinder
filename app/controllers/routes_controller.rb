class RoutesController < ApplicationController

  # GET /routes
  def index
    @countries = Country.find(:all)
    if params[:keywords_route] and not params[:keywords_route].empty?
#      if params[:country_id_route] and not params[:country_id_route].empty?
        #   @routes = Route.find(:all, :conditions => ['(routes.name LIKE ? or routes.description LIKE ?) and (places.country = ? and places.id IN routes.places)', "%#{params[:keywords]}%", "%#{params[:keywords]}%", params[:country_id]])
        @routes = Route.find(:all, :conditions => ['(routes.name LIKE ? or routes.description LIKE ? )', "%#{params[:keywords_route]}%", "%#{params[:keywords_route]}%"])
#      else
#        @routes = Route.find(:all, :conditions => ['name LIKE ? or description LIKE ?', "%#{params[:keywords_route]}%", "%#{params[:keywords_route]}%"])
#      end
    else
      @routes = Route.find(:all)
    end
  end

  # GET /routes/1
  def show
    @route = Route.find(params[:id])
    @route_id = params[:id]
    @newRoutecomment = Routecomment.new
    @routepoint = Routepoint.new
    @newFavoriteroute = Favoriteroute.new
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
    @route.user = @current_user
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

  def rate 
    @route = Route.find(params[:id]) 
    @route.rate(params[:stars], current_user, params[:dimension]) 
    render :update do |page| 
      page.replace_html @route.wrapper_dom_id(params), ratings_for(@route, params.merge(:wrap => false)) 
      page.visual_effect :highlight, @route.wrapper_dom_id(params) 
    end 
  end 

end
