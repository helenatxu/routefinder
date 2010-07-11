class SearchPlacesController < ApplicationController
  def new
    @search_place = SearchPlace.new
  end
  
  def create
    @search_place = SearchPlace.new(params[:search_place])
    if @search_place.save
      flash[:notice] = "Successfully created search place."
      redirect_to @search_place
    else
      render :action => 'new'
    end
  end
  
  def show
    @search_place = SearchPlace.find(params[:id])
  end
end
