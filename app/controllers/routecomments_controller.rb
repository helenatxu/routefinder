class RoutecommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  def index
    @routecomments = Routecomment.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @routecomment = Routecomment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @routecomment = Routecomment.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /comments/1/edit
  def edit
    @routecomment = Routecomment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @routecomment = Routecomment.new(params[:routecomment])

      if @routecomment.save
        redirect_to(@routecomment, :notice => 'Comment was successfully created.') 
      else
        render :action => "new"
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @routecomment = Routecomment.find(params[:id])

    respond_to do |format|
      if @routecomment.update_attributes(params[:routecomment])
        format.html { redirect_to(@routecomment, :notice => 'Comment was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @routecomment = Routecomment.find(params[:id])
    @routecomment.destroy

    respond_to do |format|
      format.html { redirect_to(routecomments_url) }
    end
  end
  
end
