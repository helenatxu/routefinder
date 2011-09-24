class SearchController < ApplicationController

  # Warning: routes cannot be searched by country, routes does not have country

  # GET /search
  def index

    @countries = Country.find(:all)

    allcountries = false

    if not params[:country_id] or params[:country_id] == '1'
      allcountries = true
    end


    if params[:search_p] and not params[:search_r]
      search_by = "place"
    else
      if params[:search_r] and not params[:search_p]
        search_by = "route"
      else

        if params[:search_r] and params[:search_p]
          search_by = "both"
        else

          if not params[:search_r] and not params[:search_p]
            search_by = "both"
          end
        end
      end 
    end


    if params[:keywords_search] and not params[:keywords_search].empty?
      if params[:country_id] and not params[:country_id].empty?

        # we search in places or routes with params & country
        if search_by == "place"
          if allcountries
            @search = Place.find(:all, :conditions => ['(name LIKE ? or description LIKE ?)', "%#{params[:keywords_search]}%", "%#{params[:keywords_search]}%"])
          else
            @search = Place.find(:all, :conditions => ['(name LIKE ? or description LIKE ?) and country_id = ?', "%#{params[:keywords_search]}%", "%#{params[:keywords_search]}%", params[:country_id]])
          end
        else 
          if search_by == "route"
            @search = Route.find(:all, :conditions => ['(name LIKE ? or description LIKE ?)', "%#{params[:keywords_search]}%", "%#{params[:keywords_search]}%"])

            # we search in place and routes       
          else 
            if allcountries
              @search = Route.find(:all, :conditions => ['(name LIKE ? or description LIKE ?)', "%#{params[:keywords_search]}%", "%#{params[:keywords_search]}%"]) + Place.find(:all, :conditions => ['(name LIKE ? or description LIKE ?)', "%#{params[:keywords_search]}%", "%#{params[:keywords_search]}%"])
            else
              @search = Route.find(:all, :conditions => ['(name LIKE ? or description LIKE ?)', "%#{params[:keywords_search]}%", "%#{params[:keywords_search]}%"]) + Place.find(:all, :conditions => ['(name LIKE ? or description LIKE ?) and country_id = ?', "%#{params[:keywords_search]}%", "%#{params[:keywords_search]}%", params[:country_id]])
            end

          end # of search by route
        end # of search by place

      else  # now we look for by parameters but without country

        if search_by == "place"
          @search = Place.find(:all, :conditions => ['name LIKE ? or description LIKE ?', "%#{params[:keywords_search]}%", "%#{params[:keywords_search]}%"])
        else
          if search_by == "route"
            @search = Route.find(:all, :conditions => ['name LIKE ? or description LIKE ?', "%#{params[:keywords_search]}%", "%#{params[:keywords_search]}%"])
          else 
            @search = Route.find(:all, :conditions => ['name LIKE ? or description LIKE ?', "%#{params[:keywords_search]}%", "%#{params[:keywords_search]}%"]) + Place.find(:all, :conditions => ['name LIKE ? or description LIKE ?', "%#{params[:keywords_search]}%", "%#{params[:keywords_search]}%"])
          end # of search by route

        end # of search by place by parameters but without country

      end # of search in places or routes with params & country

    else   # now we look without parameters 

      if params[:country_id] and not params[:country_id].empty?     
        # now we look without parameters but by country

        if search_by == "place"
          if allcountries
            @search = Place.find(:all)                
          else
            @search = Place.find(:all, :conditions => ['country_id = ?', params[:country_id]])    
          end
        else
          if search_by == "route"
            @search = Route.find(:all)
          else 
            if allcountries
              @search = Route.find(:all) + Place.find(:all)
            else
              @search = Route.find(:all) + Place.find(:all, :conditions => ['country_id = ?', params[:country_id]])
            end
          end # of search by route
        end # of search by place


      else   # now we look without any parameters
        if search_by == "place"
          @search = Place.find(:all)
        else

          if search_by == "route"
            @search = Route.find(:all)

          else 
            @search = Route.find(:all) + Place.find(:all)
          end # of search by route
        end # of search by place 

      end # of search without parameters but by country

    end # of search with parameters

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