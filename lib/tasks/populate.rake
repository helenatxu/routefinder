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
    open("http://openconcept.ca/sites/openconcept.ca/files/country_code_drupal_0.txt") do |countries|
      countries.read.each_line do |country|
        code, name = country.chomp.split("|")
        Country.create!(:name => name)
      end
    end

    #    Country.populate 100 do |country|
    #      country.name = Faker::Address.country
    #   end


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

      Place.populate 4 do |place|
        place.name = Populator.words(1..3).titleize
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
        place.user_id = user.id
        place.coordinates_lat = ''
        place.coordinates_long = ''
        place.direction = Faker::Address.street_address + Faker::Address.city
        place.country_id = Populator.value_in_range(1..100)
        place.description = Populator.sentences(1..7)
        place.image_url = '/images/autocaravana2.jpg'
        place.created_at = 2.years.ago..Time.now
        place.updated_at = 1.years.ago..Time.now
        Placecomment.populate 1..5 do |placecomment|
          placecomment.place_id = place.id
          placecomment.user_id = Populator.value_in_range(1..4)
          placecomment.comment = Populator.sentences(1..3)
          placecomment.date = 2.years.ago..Time.now
          placecomment.created_at = 2.years.ago..Time.now
          placecomment.updated_at = 1.years.ago..Time.now
        end
      end

    end
  end

end