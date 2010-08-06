class PlacesController < ApplicationController
  # GET /places
  # GET /places.xml

  def index
    @countries = Country.find(:all)
    if params[:keywords] and not params[:keywords].empty?
      if params[:country_id] and not params[:country_id].empty?
        @places = Place.find(:all, :conditions => ['(name LIKE ? or description LIKE ?) and country = ?', "%#{params[:keywords]}%", "%#{params[:keywords]}%", params[:country_id]])
      else
        @places = Place.find(:all, :conditions => ['name LIKE ? or description LIKE ?', "%#{params[:keywords]}%", "%#{params[:keywords]}%"])
      end
    else
      @places = Place.find(:all)
    end
  end

  def list
    @places = Place.find(:all)
  end



  # GET /places/1
  # GET /places/1.xml
  def show
    @place = Place.find(params[:id])
  end

  # GET /places/new
  # GET /places/new.xml
  def new
    @place = Place.new
    end
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
  end

  # POST /places
  # POST /places.xml
  def create
    @place = Place.new(params[:place])

      if @place.save
        redirect_to(@place, :notice => 'Place was successfully created.')
      else
        render :action => "new"
      end
  end

  # PUT /places/1
  # PUT /places/1.xml
  def update
    @place = Place.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to(@place, :notice => 'Place was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.xml
  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to(places_url) }
      format.xml  { head :ok }
    end
  end


end
