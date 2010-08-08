class PlacecommentsController < ApplicationController
  # GET /placecomments
  def index
    @placecomments = Placecomment.all
  end

  # GET /placecomments/1
  def show
    @placecomment = Placecomment.find(params[:id])
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

    if @placecomment.save
      redirect_to(@placecomment, :notice => 'Placecomment was successfully created.') 
    else
      render :action => "new" 
    end
  end

  # PUT /placecomments/1
  def update
    @placecomment = Placecomment.find(params[:id])

    if @placecomment.update_attributes(params[:placecomment])
      redirect_to(@placecomment, :notice => 'Placecomment was successfully updated.') 
    else
      render :action => "edit" 
    end
  end

  # DELETE /placecomments/1
  def destroy
    @placecomment = Placecomment.find(params[:id])
    @placecomment.destroy
    redirect_to(placecomments_url) 
  end
end
