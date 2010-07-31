class AddDataTest < ActiveRecord::Migration
  def self.up

        #down   

        Country.create(
        :name => 'Spain'
        )

        Country.create(
        :name => 'Poland'
        )

        Country.create(
        :name => 'France'
        )

        Country.create(
        :name => 'Portugal'
        )

        Country.create(
        :name => 'Italy'
        )

        User.create(
        :login => 'helenatxu', 
        :email => 'helenatxu@gmail.com',
        :crypted_password => '1234', 
        :profile => 'Hi! I am from Spain. I like travel. Nice to meet you!',
        :photo_url => '/images/autocaravana1.jpg',
        :is_admin => true,
        :crypted_password => 'lalala',
        :password_salt => 'uy',               
        :persistence_token => 'iofrfioq',                     
        :single_access_token => 'qfrewfe',                 
        :perishable_token => 'fesrww',                   
        :login_count => 0,
        :failed_login_count => 0
        )

        User.create(
        :login => 'julas', 
        :email => 'julas@julas.com',
        :crypted_password => '1234', 
        :profile => 'Hi! I like travel. Nice to meet you!',
        :photo_url => '/images/rails.png',
        :is_admin => true,
        :crypted_password => 'lalala',
        :password_salt => 'uy',               
        :persistence_token => 'ioffiaoq',                     
        :single_access_token => 'qfewafe',                 
        :perishable_token => 'feswaw',                   
        :login_count => 0,
        :failed_login_count => 0
        )

        User.create(
        :login => 'prueba', 
        :email => 'prueba@gmail.com', 
        :crypted_password => '1234', 
        :profile => 'Hi! I am from Spain. Nice to meet you!',
        :photo_url => '/images/autocaravana2.jpg',
        :is_admin => false,
        :crypted_password => 'lalala',
        :password_salt => 'uy',               
        :persistence_token => 'ioffzioq',                     
        :single_access_token => 'qfezwfe',                 
        :perishable_token => 'fezsww',                   
        :login_count => 0,
        :failed_login_count => 0
        )

        User.create(
        :login => 'pepe', 
        :email => 'pepe@gmail.com',
        :crypted_password => '1234', 
        :profile => 'Hi! I am from France. I like travel.',
        :photo_url => '/images/rails.png',
        :is_admin => false,
        :crypted_password => 'lalala',
        :password_salt => 'uy',               
        :persistence_token => 'ioffipoq',                     
        :single_access_token => 'qfepwfe',                 
        :perishable_token => 'fespww',                   
        :login_count => 0,
        :failed_login_count => 0
        )

        User.create(
        :login => 'juan', 
        :email => 'juan@julas.com',
        :crypted_password => '1234', 
        :profile => 'Hi! I am from Poland. I like travel. Nice to meet you!',
        :photo_url => '/images/autocaravana2.jpg',
        :is_admin => false,
        :crypted_password => 'lalala',
        :password_salt => 'uy',               
        :persistence_token => 'ioffioq',                     
        :single_access_token => 'qfewfe',                 
        :perishable_token => 'fnesww',                   
        :login_count => 0,
        :failed_login_count => 0
        )

        User.create(
        :login => 'maria', 
        :email => 'maria@gmail.com', 
        :crypted_password => '1234', 
        :profile => 'Hi! I am from Portugal. I like travel. Nice to meet you!',
        :photo_url => '/images/autocaravana1.jpg',
        :is_admin => false,
        :crypted_password => 'lalala',
        :password_salt => 'uy',               
        :persistence_token => 'ioffnioq',                     
        :single_access_token => 'qfnewfe',                 
        :perishable_token => 'feswnw',                   
        :login_count => 0,
        :failed_login_count => 0
        )


        Comment.create(
        :users_id => 1,
        :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
        a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
        ornare urna, quis pulvinar magna aliquet ac.'
        )
        

        Comment.create(
        :users_id => 2,
        :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
        a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
        ornare urna, quis pulvinar magna aliquet ac.'
        )

        Comment.create(
        :users_id => 2,
        :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
        a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
        ornare urna, quis pulvinar magna aliquet ac.'
        )

        Comment.create(
        :users_id => 1,
        :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
        a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
        ornare urna, quis pulvinar magna aliquet ac.'
        )
        

        Comment.create(
        :users_id => 3,
        :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
        a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
        ornare urna, quis pulvinar magna aliquet ac.'
        )

        Comment.create(
        :users_id => 3,
        :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
        a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
        ornare urna, quis pulvinar magna aliquet ac.'
        )
        
        
        Place.create(
        :name => 'Place1', 
        :coordinates_lat => 1.00203013,
        :coordinates_long => -2.235532,
        :direction => 'ul. Piotrkowska, nº 2, Lodz, Polska',
        :countries_id => 2,
        :rank => 2.0,
        :users_id => 1,
        :description => 'Long handle bag made of skin. Including that based portfolio - Removable inner wallet. Dimensions: 25 x 36 12 cms.',
        :image_url => '/images/autocaravana1.jpg',
        :comments_id => 1
        )

        Place.create(
        :name => 'Place2', 
        :coordinates_lat => 1.00203013,
        :coordinates_long => -2.235532,
        :direction => 'C/ Pintor Manuel Siguenza, nº6, Pinedo, Valencia',
        :countries_id => 1,
        :rank => 5.0,
        :users_id => 2,
        :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
        a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
        ornare urna, quis pulvinar magna aliquet ac.',
        :image_url => '/images/autocaravana2.jpg',
        :comments_id => 2
        )

        Place.create(
        :name => 'Place3', 
        :coordinates_lat => 4.00203013,
        :coordinates_long => -5.235532,
        :direction => 'C/ del Mar, nº2, Valencia',
        :countries_id => 1,
        :rank => 1.0,
        :users_id => 3,
        :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
        a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
        ornare urna, quis pulvinar magna aliquet ac.',
        :image_url => '/images/autocaravana1.jpg',
        :comments_id => 3
        )

        Route.create(
        :name => 'Route1', 
        :rank => 3.0,
        :users_id => 1,
        :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
        a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
        ornare urna, quis pulvinar magna aliquet ac.',
        :places_id => 1,
        :comments_id => 4
        )

        Route.create(
        :name => 'Route2', 
        :rank => 2.0,
        :users_id => 2,
        :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
        a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
        ornare urna, quis pulvinar magna aliquet ac.',
        :places_id => 3,
        :comments_id => 5
        )

        Route.create(
        :name => 'Route3', 
        :rank => 5.0,
        :users_id => 3,
        :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
        a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
        ornare urna, quis pulvinar magna aliquet ac.',
        :places_id => 2,
        :comments_id => 6
        )
        




        # . . . 

      end 

      def self.down



      end

    end
