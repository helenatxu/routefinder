class FavoriteroutesController < ApplicationController
  # GET /favoriteroutes
  # GET /favoriteroutes.xml
  def index
    @favoriteroutes = Favoriteroute.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @favoriteroutes }
    end
  end

  # GET /favoriteroutes/1
  # GET /favoriteroutes/1.xml
  def show
    @favoriteroute = Favoriteroute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @favoriteroute }
    end
  end

  # GET /favoriteroutes/new
  # GET /favoriteroutes/new.xml
  def new
    @favoriteroute = Favoriteroute.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @favoriteroute }
    end
  end

  # GET /favoriteroutes/1/edit
  def edit
    @favoriteroute = Favoriteroute.find(params[:id])
  end

  # POST /favoriteroutes
  # POST /favoriteroutes.xml
  def create
    @favoriteroute = Favoriteroute.new(params[:favoriteroute])

    respond_to do |format|
      if @favoriteroute.save
        format.html { redirect_to(@favoriteroute, :notice => 'Favoriteroute was successfully created.') }
        format.xml  { render :xml => @favoriteroute, :status => :created, :location => @favoriteroute }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @favoriteroute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /favoriteroutes/1
  # PUT /favoriteroutes/1.xml
  def update
    @favoriteroute = Favoriteroute.find(params[:id])

    respond_to do |format|
      if @favoriteroute.update_attributes(params[:favoriteroute])
        format.html { redirect_to(@favoriteroute, :notice => 'Favoriteroute was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @favoriteroute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /favoriteroutes/1
  # DELETE /favoriteroutes/1.xml
  def destroy
    @favoriteroute = Favoriteroute.find(params[:id])
    @favoriteroute.destroy

    respond_to do |format|
      format.html { redirect_to(favoriteroutes_url) }
      format.xml  { head :ok }
    end
  end
end
