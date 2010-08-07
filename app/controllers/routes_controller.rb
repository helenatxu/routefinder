class RoutesController < ApplicationController
  # GET /routes
  # GET /routes.xml


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
  # GET /routes/1.xml
  def show
    @route = Route.find(params[:id])
    @routecomments = Routecomment.find(:all, :conditions => ['route_id = ?', params[:id]])
    @newRoutecomment = Routecomment.new
  end

  # GET /routes/new
  # GET /routes/new.xml
  def new
    @route = Route.new
  end

  # GET /routes/1/edit
  def edit
    @route = Route.find(params[:id])
  end

  # POST /routes
  # POST /routes.xml
  def create
    @route = Route.new(params[:route])

    if @route.save
      redirect_to(@route, :notice => 'Route was successfully created.') 
    else
      render :action => "new" 
    end
  end


  # PUT /routes/1
  # PUT /routes/1.xml
  def update
    @route = Route.find(params[:id])
    if @route.update_attributes(params[:route])
      redirect_to(@route, :notice => 'Route was successfully updated.') 
    else
      render :action => "edit" 
    end
  end


  # DELETE /routes/1
  # DELETE /routes/1.xml
  def destroy
    @route = Route.find(params[:id])
    @route.destroy
    redirect_to(routes_url) 
  end

  ################################## Comments actions


  # GET /comments/new
  def new_comment
    @routecomment = Routecomment.new
  end

  # GET /comments/1/edit
  def edit_comment
    @routecomment = Routecomment.find(params[:id])
  end

  # POST /comments
  def create_comment
    @route = Route.find(params[:id])
    @routecomment = Routecomment.new(
    :comment => params[:comment],
    :user_id => current_user.user_id,
    :route_id => @route.route_id
    )

    if @routecomment.save
      redirect_to(@route, :notice => 'Comment was successfully created.') 
    else
      render :action => "new"
    end
  end




  # PUT /comments/1
  def update_comments
    @routecomment = Routecomment.find(params[:id])
    if @routecomment.update_attributes(params[:routecomment])
      redirect_to(@routecomment, :notice => 'Comment was successfully updated.') 
    else
      render :action => "edit" 
    end
  end

  # DELETE /comments/1
  def destroy_comments
    @routecomment = Routecomment.find(params[:id])
    @routecomment.destroy
    redirect_to(routecomments_url) 
  end


end
