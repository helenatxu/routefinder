class FavoriteroutesController < ApplicationController
  
  # GET /favoriteroutes
  def index
    @favoriteroutes = Favoriteroute.all
  end


  # GET /favoriteroutes/new
  def new
    @favoriteroute = Favoriteroute.new
  end



  # POST /favoriteroutes
  def create
    @favoriteroute = Favoriteroute.new(params[:favoriteroute])
    @favoriteroute.user = @current_user
      if @favoriteroute.save
        redirect_to route_path(@favoriteroute[:route_id]), :notice => 'Route aded to your favorites.'
      else
        render :action => "new" 
      end
  end



  # DELETE /favoriteroutes/1
  def destroy
    @favoriteroute = Favoriteroute.find(params[:id])
    @favoriteroute.destroy
    redirect_to account_url, :notice => 'Your favorite route was deleted.'
  end
end
