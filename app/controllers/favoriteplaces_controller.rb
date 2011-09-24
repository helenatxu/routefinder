class FavoriteplacesController < ApplicationController
  
  # GET /favoriteplaces
  def index
    @favoriteplaces = Favoriteplace.all
  end


  # GET /favoriteplaces/new
  def new
    @favoriteplace = Favoriteplace.new
  end



  # POST /favoriteplaces
  def create
    @favoriteplace = Favoriteplace.new(params[:favoriteplace])
    @favoriteplace.user = @current_user
      if @favoriteplace.save
        redirect_to place_path(@favoriteplace[:place_id]), :notice => 'Place added to your favorites.'
      else
        render :action => "new" 
    end
  end



  # DELETE /favoriteplaces/1
  def destroy
    @favoriteplace = Favoriteplace.find(params[:id])
    @favoriteplace.destroy
    redirect_to account_url, :notice => 'The place was deleted from your favorites.'
  end
end
