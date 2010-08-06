class PlacecommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  def index
    @placecomments = Placecomment.all
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @placecomment = Placecomment.find(params[:id])
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @placecomment = Placecomment.new
  end

  # GET /comments/1/edit
  def edit
    @placecomment = Placecomment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @placecomment = Placecomment.new(params[:placecomment])

    respond_to do |format|
      if @placecomment.save
        format.html { redirect_to(@placecomment, :notice => 'Comment was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @placecomment = Placecomment.find(params[:id])

    respond_to do |format|
      if @placecomment.update_attributes(params[:placecomment])
        format.html { redirect_to(@placecomment, :notice => 'Comment was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @placecomment = Placecomment.find(params[:id])
    @placecomment.destroy

    respond_to do |format|
      format.html { redirect_to(placecomments_url) }
    end
  end
end
