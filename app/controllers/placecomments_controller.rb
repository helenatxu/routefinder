class PlacecommentsController < ApplicationController
  
  # GET /placecomments
  def index
    @routecomments = Routecomment.find(:all, :conditions => ['route_id = ?', params[:id]])
  end

  # GET /placecomments/new
  def new
    @placecomment = Placecomment.new
  end

  # GET /placecomments/1/edit
  def edit
    @placecomment = Placecomment.find(params[:id])
  end



  # POST /placecomments
  def create
    @placecomment = Placecomment.new(params[:placecomment])
    @placecomment.user = @current_user
    @placecomment[:date] = Time.now
    if @placecomment.save
      redirect_to place_path(@placecomment[:place_id]), :notice => 'Your comment was added.'
    else
      render :action => "new" 
    end
  end
  
  
  # PUT /placecomments/1
  def update
    @placecomment = Placecomment.find(params[:id])
    if @placecomment.update_attributes(params[:placecomment])
      redirect_to place_path(@placecomment[:place_id]), :notice => 'Your comment was updated.'
    else
      render :action => "edit" 
    end
  end


  # DELETE /placecomments/1
  def destroy
    @placecomment = Placecomment.find(params[:id])
    @placecomment.destroy
    redirect_to place_path(@placecomment[:place_id]), :notice => 'Your comment was deleted.'
  end
  
end