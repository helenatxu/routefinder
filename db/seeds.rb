# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

# namespace :db do
#   desc "Erase and fill database"
#   task :populate => :environment do
    require 'open-uri'
    require 'populator'
    require 'faker'

    [Country, User, Place, Route, Routecomment, Routepoint, Placecomment].each(&:delete_all)

    ActiveRecord::Base.connection.execute "delete from sqlite_sequence where name = 'users'"
    ActiveRecord::Base.connection.execute "delete from sqlite_sequence where name = 'placecomments'"
    # ActiveRecord::Base.connection.execute "delete from sqlite_sequence where name = 'users'"
    # ActiveRecord::Base.connection.execute "delete from sqlite_sequence where name = 'users'"
    # ActiveRecord::Base.connection.execute "delete from sqlite_sequence where name = 'users'"
    # ActiveRecord::Base.connection.execute "delete from sqlite_sequence where name = 'users'"
    # ActiveRecord::Base.connection.execute "delete from sqlite_sequence where name = 'users'"

    Country.delete_all
    count_countries = 0
    open("#{Rails.root}/public/text/fewcountries.txt") do |countries|
      countries.read.each_line do |country|
        code, name = country.chomp.split("|")
        Country.create!(:name => name, :id => count_countries)
        count_countries = count_countries + 1
      end
    end

    count_users = 0
    User.populate 1 do |user|
      count_users = count_users + 1
      user.id = count_users
      user.login = Faker::Internet.user_name
      user.email = Faker::Internet.email
      user.crypted_password   = Faker::Lorem.words
      user.profile = Populator.sentences(1..4)
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


        count_routes = 0
        count_routepoint_order = 0
        Route.populate 1..7 do |route|
          count_routepoint_order = count_routepoint_order + 1
          route.id = count_routes
          count_routes = count_routes + 1
          route.name = Populator.words(1..5).titleize
          route.description = Populator.sentences(2..10)
          route.user_id = user.id
          route.created_at = 2.years.ago..Time.now
          route.updated_at = 1.years.ago..Time.now
          count_routecomments = 0
          Routecomment.populate 1..5 do |routecomment|
            routecomment.id = count_routecomments 
            count_routecomments = count_routecomments + 1
            routecomment.route_id = route.id  
            routecomment.user_id = [1, 4]
            routecomment.comment = Populator.sentences(2..10)
            routecomment.date = 2.years.ago..Time.now
            routecomment.created_at = 2.years.ago..Time.now
            routecomment.updated_at = 1.years.ago..Time.now
          end
          
          count_routepoints = 0
          Routepoint.populate 1..2 do |routepoint|
            routepoint.id = count_routepoints
            count_routepoints = count_routepoints + 1
            routepoint.route_id = route.id
            routepoint.place_id = [1, 11]
            routepoint.order = count_routepoint_order
            routepoint.created_at = 2.years.ago..Time.now
            routepoint.updated_at = 1.years.ago..Time.now
          end
        end

      end


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
    count_placecomments = 0
    Placecomment.populate 1..3 do |placecomment|
      placecomment.id = count_placecomments
      count_placecomments = count_placecomments + 1
      placecomment.place_id = place.id
      placecomment.user_id = [1, 4]
      placecomment.comment = Populator.sentences(2..10)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
    
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
    count_placecomments = 0
    Placecomment.populate 1..3 do |placecomment|
      placecomment.id = count_placecomments
      count_placecomments = count_placecomments + 1
      placecomment.place_id = place.id
      placecomment.user_id = [1, 3]
      placecomment.comment = Populator.sentences(2..10)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
    
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
    count_placecomments = 0
    Placecomment.populate 1..2 do |placecomment|
      placecomment.id = count_placecomments
      count_placecomments = count_placecomments + 1
      placecomment.place_id = place.id
      placecomment.user_id = [1, 2]
      placecomment.comment = Populator.sentences(1..3)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
    
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
    count_placecomments = 0
    Placecomment.populate 1..2 do |placecomment|
      placecomment.id = count_placecomments
      count_placecomments = count_placecomments + 1
      placecomment.place_id = place.id
      placecomment.user_id = [1, 4]
      placecomment.comment = Populator.sentences(0..4)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
    
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
    count_placecomments = 0
    Placecomment.populate 1..5 do |placecomment|
      placecomment.id = count_placecomments
      count_placecomments = count_placecomments + 1
      placecomment.place_id = place.id
      placecomment.user_id = [1, 4]
      placecomment.comment = Populator.sentences(2..10)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
    
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
    count_placecomments = 0
    Placecomment.populate 1..3 do |placecomment|
      placecomment.id = count_placecomments
      count_placecomments = count_placecomments + 1
      placecomment.place_id = place.id
      placecomment.user_id = [1, 3]
      placecomment.comment = Populator.sentences(0..3)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
    
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
    count_placecomments = 0
    Placecomment.populate 1..5 do |placecomment|
      placecomment.id = count_placecomments
      count_placecomments = count_placecomments + 1
      placecomment.place_id = place.id
      placecomment.user_id = [1, 4]
      placecomment.comment = Populator.sentences(0..3)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
    
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
    count_placecomments = 0
    Placecomment.populate 1..5 do |placecomment|
      placecomment.id = count_placecomments
      count_placecomments = count_placecomments + 1
      placecomment.place_id = place.id
      placecomment.user_id = [1, 4]
      placecomment.comment = Populator.sentences(1..3)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
    
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
    count_placecomments = 0
    Placecomment.populate 1..5 do |placecomment|
      placecomment.id = count_placecomments
      count_placecomments = count_placecomments + 1
      placecomment.place_id = place.id
      placecomment.user_id = [1, 4]
      placecomment.comment = Populator.sentences(0..4)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
    
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
    count_placecomments = 0
    Placecomment.populate 1..5 do |placecomment|
      placecomment.id = count_placecomments
      count_placecomments = count_placecomments + 1
      placecomment.place_id = place.id
      placecomment.user_id = [1, 4]
      placecomment.comment = Populator.sentences(2..10)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end
    
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
    count_placecomments = 0
    Placecomment.populate 1..5 do |placecomment|
      placecomment.id = count_placecomments
      count_placecomments = count_placecomments + 1
      placecomment.place_id = place.id
      placecomment.user_id = [1, 4]
      placecomment.comment = Populator.sentences(1..4)
      placecomment.date = 2.years.ago..Time.now
      placecomment.created_at = 2.years.ago..Time.now
      placecomment.updated_at = 1.years.ago..Time.now
    end