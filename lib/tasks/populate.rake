namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'open-uri'
    require 'populator'
    require 'faker'

    [Country, User, Place, Route, Routecomment, Routepoint, Placecomment].each(&:delete_all)

    ActiveRecord::Base.connection.select_value('delete from sqlite_sequence where name="countries"')
    ActiveRecord::Base.connection.select_value('delete from sqlite_sequence where name="placecomments"')
    ActiveRecord::Base.connection.select_value('delete from sqlite_sequence where name="routecomments"')
    ActiveRecord::Base.connection.select_value('delete from sqlite_sequence where name="favoriteplaces"')
    ActiveRecord::Base.connection.select_value('delete from sqlite_sequence where name="places"')
    ActiveRecord::Base.connection.select_value('delete from sqlite_sequence where name="routepoints"')
    ActiveRecord::Base.connection.select_value('delete from sqlite_sequence where name="favoriteroutes"')
    ActiveRecord::Base.connection.select_value('delete from sqlite_sequence where name="sessions"')
    ActiveRecord::Base.connection.select_value('delete from sqlite_sequence where name="rates"')
    ActiveRecord::Base.connection.select_value('delete from sqlite_sequence where name="countries"')
    ActiveRecord::Base.connection.select_value('delete from sqlite_sequence where name="users"')

    Country.delete_all
    open("#{Rails.root}/public/text/fewcountries.txt") do |countries|
      countries.read.each_line do |country|
        code, name = country.chomp.split("|")
        Country.create!(:name => name)
      end
    end

    #    Country.populate 100 do |country|
    #      country.name = Faker::Address.country
    #   end


    Place.populate 1 do |place|
    place.name = 'Piazza di San Marco, Venezia'
    place.user_id = 1
    place.coordinates_lat = ''
    place.coordinates_long = ''
    place.direction = 'Piazza di San Marco, Venezzia'
    place.country_id = 3
    place.description = Populator.sentences(2..10)
    place.image_url = '/images/autocaravana2.jpg'
    place.created_at = 2.years.ago..Time.now
    place.updated_at = 1.years.ago..Time.now
    Placecomment.populate 1..3 do |placecomment|
      placecomment.place_id = place.id
      placecomment.user_id = [1, 4]
      placecomment.comment = Populator.sentences(2..10)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
  end
    
    Place.populate 1 do |place|
    place.name = 'La Fontana, Roma'
    place.user_id = 2
    place.coordinates_lat = ''
    place.coordinates_long = ''
    place.direction = 'Fontana di Trevi, Roma'
    place.country_id = 3
    place.description = Populator.sentences(2..10)
    place.image_url = '/images/autocaravana1.jpg'
    place.created_at = 2.years.ago..Time.now
    place.updated_at = 1.years.ago..Time.now
    Placecomment.populate 1..3 do |placecomment|
      placecomment.place_id = place.id
      placecomment.user_id = [1, 3]
      placecomment.comment = Populator.sentences(2..10)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
  end
    Place.populate 1 do |place|
    place.name = 'IX Dorm in Lodz'
    place.user_id = 3
    place.coordinates_lat = ''
    place.coordinates_long = ''
    place.direction = 'ul. Czerwona 1, Lodz'
    place.country_id = 4
    place.description = Populator.sentences(2..10)
    place.image_url = '/images/autocaravana2.jpg'
    place.created_at = 2.years.ago..Time.now
    place.updated_at = 1.years.ago..Time.now
    Placecomment.populate 1..2 do |placecomment|
      placecomment.place_id = place.id
      placecomment.user_id = [1, 2]
      placecomment.comment = Populator.sentences(1..3)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
  end
    
    Place.populate 1 do |place|
    place.name = 'Piotrkowska, Lodz'
    place.user_id = 3
    place.coordinates_lat = ''
    place.coordinates_long = ''
    place.direction = 'Piotrkowska 100, Lodz'
    place.country_id = 4
    place.description = Populator.sentences(1..3)
    place.image_url = '/images/autocaravana1.jpg'
    place.created_at = 2.years.ago..Time.now
    place.updated_at = 1.years.ago..Time.now
    Placecomment.populate 1..2 do |placecomment|
      placecomment.place_id = place.id
      placecomment.user_id = [1, 4]
      placecomment.comment = Populator.sentences(0..4)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
  end
    
    Place.populate 1 do |place|
    place.name = 'Nice district in Valencia'
    place.user_id = 4
    place.coordinates_lat = ''
    place.coordinates_long = ''
    place.direction = 'C/Doctor Manuel Candela, 10, Valencia'
    place.country_id = 5
    place.description = Populator.sentences(1..3)
    place.image_url = '/images/autocaravana2.jpg'
    place.created_at = 2.years.ago..Time.now
    place.updated_at = 1.years.ago..Time.now
    Placecomment.populate 1..5 do |placecomment|
      placecomment.place_id = place.id
      placecomment.user_id = [1, 4]
      placecomment.comment = Populator.sentences(2..10)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
  end
    
    
    Place.populate 1 do |place|
    place.name = 'The Beach in Valencia'
    place.user_id = 4
    place.coordinates_lat = ''
    place.coordinates_long = ''
    place.direction = 'Playa de las Arenas, Valencia'
    place.country_id = 5
    place.description = Populator.sentences(2..10)
    place.image_url = '/images/autocaravana2.jpg'
    place.created_at = 2.years.ago..Time.now
    place.updated_at = 1.years.ago..Time.now
    Placecomment.populate 1..3 do |placecomment|
      placecomment.place_id = place.id
      placecomment.user_id = [1, 3]
      placecomment.comment = Populator.sentences(0..3)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
  end
    
    Place.populate 1 do |place|
    place.name = 'Universidad Politécnica de Valencia'
    place.user_id = 4
    place.coordinates_lat = ''
    place.coordinates_long = ''
    place.direction = 'Univeridad Politécnica de Valencia'
    place.country_id = 5
    place.description = Populator.sentences(2..10)
    place.image_url = '/images/autocaravana1.jpg'
    place.created_at = 2.years.ago..Time.now
    place.updated_at = 1.years.ago..Time.now
    Placecomment.populate 1..5 do |placecomment|
      placecomment.place_id = place.id
      placecomment.user_id = [1, 4]
      placecomment.comment = Populator.sentences(0..3)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
  end
    
    Place.populate 1 do |place|
    place.name = 'The train station in Amsterdam'
    place.user_id = 1
    place.coordinates_lat = ''
    place.coordinates_long = ''
    place.direction = 'Centraal Station, Amsterdam'
    place.country_id = 6
    place.description = Populator.sentences(2..10)
    place.image_url = '/images/autocaravana2.jpg'
    place.created_at = 2.years.ago..Time.now
    place.updated_at = 1.years.ago..Time.now
    Placecomment.populate 1..5 do |placecomment|
      placecomment.place_id = place.id
      placecomment.user_id = [1, 4]
      placecomment.comment = Populator.sentences(1..3)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
  end
    
    Place.populate 1 do |place|
    place.name = 'The Louvre Museum'
    place.user_id = 2
    place.coordinates_lat = ''
    place.coordinates_long = ''
    place.direction = 'Musee du Louvre, Paris'
    place.country_id = 2
    place.description = Populator.sentences(2..10)
    place.image_url = '/images/autocaravana1.jpg'
    place.created_at = 2.years.ago..Time.now
    place.updated_at = 1.years.ago..Time.now
    Placecomment.populate 1..5 do |placecomment|
      placecomment.place_id = place.id
      placecomment.user_id = [1, 4]
      placecomment.comment = Populator.sentences(0..4)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
  end
    
    Place.populate 1 do |place|
    place.name = '5th Avenue in New York'
    place.user_id = 3
    place.coordinates_lat = ''
    place.coordinates_long = ''
    place.direction = 'Fith Avenue, New York'
    place.country_id = 8
    place.description = Populator.sentences(1..4)
    place.image_url = '/images/autocaravana2.jpg'
    place.created_at = 2.years.ago..Time.now
    place.updated_at = 1.years.ago..Time.now
    Placecomment.populate 1..5 do |placecomment|
      placecomment.place_id = place.id
      placecomment.user_id = [1, 4]
      placecomment.comment = Populator.sentences(2..10)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
  end
    
    Place.populate 1 do |place|
    place.name = 'Nice Village in Virginia'
    place.user_id = 3
    place.coordinates_lat = ''
    place.coordinates_long = ''
    place.direction = 'Charlottesville, VA'
    place.country_id = 8
    place.description = Populator.sentences(2..10)
    place.image_url = '/images/autocaravana1.jpg'
    place.created_at = 2.years.ago..Time.now
    place.updated_at = 1.years.ago..Time.now
    Placecomment.populate 1..5 do |placecomment|
      placecomment.place_id = place.id
      placecomment.user_id = [1, 4]
      placecomment.comment = Populator.sentences(1..4)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
  end
    
    
    User.populate 4 do |user|
      user.login = Faker::Internet.user_name
      user.email = Faker::Internet.email
      user.crypted_password   = Faker::Lorem.words
      user.profile = Populator.sentences(1..2)
      user.photo_url = '/images/autocaravana1.jpg'
      user.is_admin = true
      user.password_salt = 'uy'
      user.persistence_token = 'iofrfioq'
      user.single_access_token = 'qfrewfe'
      user.perishable_token = 'fesrww'
      user.login_count = 0
      user.failed_login_count = 0
      user.created_at = 2.years.ago..Time.now
      user.updated_at = 1.years.ago..Time.now

      Route.populate 1..3 do |route|
        route.name = Populator.words(1..5).titleize
        route.description = Populator.sentences(1..7)
        route.user_id = user.id
        route.created_at = 2.years.ago..Time.now
        route.updated_at = 1.years.ago..Time.now
        Routecomment.populate 1..5 do |routecomment|
          routecomment.route_id = route.id  
          routecomment.user_id = Populator.value_in_range(1..4)
          routecomment.comment = Populator.sentences(1..3)
          routecomment.date = 2.years.ago..Time.now
          routecomment.created_at = 2.years.ago..Time.now
          routecomment.updated_at = 1.years.ago..Time.now
        end
        count = 0
        Routepoint.populate 1..5 do |routepoint|
          count = count + 1
          routepoint.route_id = route.id
          routepoint.place_id = Populator.value_in_range(1..16)
          routepoint.order = count
          routepoint.created_at = 2.years.ago..Time.now
          routepoint.updated_at = 1.years.ago..Time.now
        end
      end    


    end


  end

end