class PlacesController < ApplicationController

  # GET /places
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

  # GET /places/1
  def show
    @place = Place.find(params[:id])
    @place_id = params[:id]
    @newPlacecomment = Placecomment.new
    @newFavoriteplace = Favoriteplace.new
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
  end

  # POST /places
  def create
    @place = Place.new(params[:place])
    @place.user = @current_user
    if @place.save
      redirect_to(@place, :notice => 'Place was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /places/1
  def update
    @place = Place.find(params[:id])
    if @place.update_attributes(params[:place])
      redirect_to(@place, :notice => 'Place was successfully updated.') 
    else
      render :action => "edit" 
    end
  end

  # DELETE /places/1
  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to(places_url)
  end

  def rate 
      @place = Place.find(params[:id]) 
      @place.rate(params[:stars], current_user, params[:dimension]) 
      render :update do |page| 
        page.replace_html @place.wrapper_dom_id(params), ratings_for(@place, params.merge(:wrap => false)) 
        page.visual_effect :highlight, @place.wrapper_dom_id(params) 
      end 
    end

end

