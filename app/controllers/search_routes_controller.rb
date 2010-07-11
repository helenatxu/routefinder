class SearchRoutesController < ApplicationController
  def new
    @search_route = SearchRoute.new
  end
  
  def create
    @search_route = SearchRoute.new(params[:search_route])
    if @search_route.save
      flash[:notice] = "Successfully created search route."
      redirect_to @search_route
    else
      render :action => 'new'
    end
  end
  
  def show
    @search_route = SearchRoute.find(params[:id])
  end
end
