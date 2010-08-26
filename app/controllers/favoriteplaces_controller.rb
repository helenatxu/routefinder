class FavoriteplacesController < ApplicationController
  # GET /favoriteplaces
  # GET /favoriteplaces.xml

  def index
#    @favoriteplaces = Favoriteplace.all
    @favoriteplaces = Favoriteplace.find(:all, :conditions => ['user_id = ?', @current_user])        
  end



  # GET /favoriteplaces/new
  # GET /favoriteplaces/new.xml
  def new
    @favoriteplace = Favoriteplace.new
  end



  # POST /favoriteplaces

  def create
    @favoriteplace = Favoriteplace.new(params[:favoriteplace])
    @favoriteplace.user = @current_user
      if @favoriteplace.save
        redirect_to place_path(@favoriteplace[:place_id]), :notice => 'Place aded to your favorites.'
      else
        render :action => "new" 
    end
  end



  # DELETE /favoriteplaces/1
  # DELETE /favoriteplaces/1.xml
  def destroy
    @favoriteplace = Favoriteplace.find(params[:id])
    @favoriteplace.destroy
    redirect_to account_url, :notice => 'Your favorite place was deleted.'
    
  end
end
