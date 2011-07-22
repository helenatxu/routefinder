class SearchController < ApplicationController


  # GET /search
  def index

    @countries = Country.find(:all) 
    if params[:search_by] and not params[:search_by].empty?
      search_by = params[:search_by]
    else
      search_by = "both"
    end

    if params[:keywords_search] and not params[:keywords_search].empty?
      if params[:country_id] and not params[:country_id].empty?

        # we search in places or routes with country
        if search_by == "place" 
          @search = Place.find(:all, :conditions => ['(name LIKE ? or description LIKE ?) and country_id = ?', "%#{params[:keywords_search]}%", "%#{params[:keywords_search]}%", params[:country_id]])

        else 
          if search_by == "route"
            @search = Route.find(:all, :conditions => ['(name LIKE ? or description LIKE ?) and country_id = ?', "%#{params[:keywords_search]}%", "%#{params[:keywords_search]}%", params[:country_id]])

            # we search in place and routes       
          else 
             @search = Place.find(:all) and Route.find(:all)
            # @search = Place.find(:all, :conditions => ['(name LIKE ? or description LIKE ?) and country_id = ?', "%#{params[:keywords_search]}%", "%#{params[:keywords_search]}%", params[:country_id]]) and Route.find(:all, :conditions => ['(name LIKE ? or description LIKE ?) and country_id = ?', "%#{params[:keywords_search]}%", "%#{params[:keywords_search]}%", params[:country_id]]) 
          end
        end

        # now we look for without country
      else 
        if search_by == "place"
          @search = Place.find(:all, :conditions => ['name LIKE ? or description LIKE ?', "%#{params[:keywords_search]}%", "%#{params[:keywords_search]}%"])
        else

          if search_by == "route"
            @search = Route.find(:all, :conditions => ['name LIKE ? or description LIKE ?', "%#{params[:keywords_search]}%", "%#{params[:keywords_search]}%"])

          else 
            @search = Place.find(:all) and Route.find(:all)
          end

        end
      end
      # now we look without parameters
    else
      @search = Route.find(:all) + Place.find(:all)
    end

  end  # end of def
end    # end of class


#  if search_by == "place"
#  @search = Place.find() 
#  else 
#   if search_by == "route"
#   @search = Place.find()
#   else
#   @search = Place.find(:all) and Route.find(:all)
#   end
# end