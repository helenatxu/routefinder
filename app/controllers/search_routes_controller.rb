class SearchRoutesController < ApplicationController
  
  def show
    @search_route = SearchRoute.find(params[:id])
  end
  
end
