class PlacecommentsController < ApplicationController
  # GET /placecomments
  # GET /placecomments.xml
  def index
    @placecomments = Placecomment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @placecomments }
    end
  end

  # GET /placecomments/1
  # GET /placecomments/1.xml
  def show
    @placecomment = Placecomment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @placecomment }
    end
  end

  # GET /placecomments/new
  # GET /placecomments/new.xml
  def new
    @placecomment = Placecomment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @placecomment }
    end
  end

  # GET /placecomments/1/edit
  def edit
    @placecomment = Placecomment.find(params[:id])
  end

  # POST /placecomments
  # POST /placecomments.xml
  def create
    @placecomment = Placecomment.new(params[:placecomment])

    respond_to do |format|
      if @placecomment.save
        format.html { redirect_to(@placecomment, :notice => 'Placecomment was successfully created.') }
        format.xml  { render :xml => @placecomment, :status => :created, :location => @placecomment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @placecomment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /placecomments/1
  # PUT /placecomments/1.xml
  def update
    @placecomment = Placecomment.find(params[:id])

    respond_to do |format|
      if @placecomment.update_attributes(params[:placecomment])
        format.html { redirect_to(@placecomment, :notice => 'Placecomment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @placecomment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /placecomments/1
  # DELETE /placecomments/1.xml
  def destroy
    @placecomment = Placecomment.find(params[:id])
    @placecomment.destroy

    respond_to do |format|
      format.html { redirect_to(placecomments_url) }
      format.xml  { head :ok }
    end
  end
end
