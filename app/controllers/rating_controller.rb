class RatingController < ApplicationController

before_filter :login_required

  def rateroute
    @route = Route.find(params[:id])
    Rating.delete_all(["rateable_type = 'Route' AND rateable_id = ? AND user_id = ?",
      @route.id, current_user.id])
      @route.add_rating Rating.new(:rating => params[:rating],
      :user_id => current_user.id)
    end



    def rateplace     
      @place = Place.find(params[:id])
      Rating.delete_all(["rateable_type = 'Place' AND rateable_id = ? AND user_id = ?",
        @place.id, current_user.id])
        @place.add_rating Rating.new(:rating => params[:rating],
        :user_id => current_user.id)
      end

    end

  end

end


