class RoutecommentsController < ApplicationController
  # GET /routecomments
  # GET /routecomments.xml
  def index
    @routecomments = Routecomment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @routecomments }
    end
  end

  # GET /routecomments/1
  # GET /routecomments/1.xml
  def show
    @routecomment = Routecomment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @routecomment }
    end
  end

  # GET /routecomments/new
  # GET /routecomments/new.xml
  def new
    @routecomment = Routecomment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @routecomment }
    end
  end

  # GET /routecomments/1/edit
  def edit
    @routecomment = Routecomment.find(params[:id])
  end

  # POST /routecomments
  # POST /routecomments.xml
  def create
    @routecomment = Routecomment.new(params[:routecomment])

    respond_to do |format|
      if @routecomment.save
        format.html { redirect_to(@routecomment, :notice => 'Routecomment was successfully created.') }
        format.xml  { render :xml => @routecomment, :status => :created, :location => @routecomment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @routecomment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /routecomments/1
  # PUT /routecomments/1.xml
  def update
    @routecomment = Routecomment.find(params[:id])

    respond_to do |format|
      if @routecomment.update_attributes(params[:routecomment])
        format.html { redirect_to(@routecomment, :notice => 'Routecomment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @routecomment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /routecomments/1
  # DELETE /routecomments/1.xml
  def destroy
    @routecomment = Routecomment.find(params[:id])
    @routecomment.destroy

    respond_to do |format|
      format.html { redirect_to(routecomments_url) }
      format.xml  { head :ok }
    end
  end
end
