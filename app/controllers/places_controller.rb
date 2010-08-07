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
  if @place.update_attributes(params[:place])
    redirect_to(@place, :notice => 'Place was successfully updated.') 
  else
    render :action => "edit" 
  end

  # DELETE /places/1
  # DELETE /places/1.xml
  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to(places_url)
  end


  ################################## Comments controllers

  def index_comments
    @placecomments = Placecomment.all
  end

  # GET /comments/1
  def show_comments
    @placecomment = Placecomment.find(params[:id])
  end

  # GET /comments/new
  def new_comments
    @placecomment = Placecomment.new
  end

  # GET /comments/1/edit
  def edit_comments
    @placecomment = Placecomment.find(params[:id])
  end

  # POST /comments
  def create_comments
    @placecomment = Placecomment.new(params[:placecomment])
    if @placecomment.save
      redirect_to(@placecomment, :notice => 'Comment was successfully created.') 
    else
      render :action => "new" 
    end
  end


  # PUT /comments/1
  def update_comments
    @placecomment = Placecomment.find(params[:id])
    if @placecomment.update_attributes(params[:placecomment])
      redirect_to(@placecomment, :notice => 'Comment was successfully updated.') 
    else
      render :action => "edit" 
    end
  end


  # DELETE /comments/1
  def destroy_comments
    @placecomment = Placecomment.find(params[:id])
    @placecomment.destroy
    redirect_to(placecomments_url) 
  end
end

