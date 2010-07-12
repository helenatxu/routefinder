class AddTestData < ActiveRecord::Migration
  def self.up

    Place.delete_all 
    Route.delete_all 
    Comment.delete_all
    User.delete_all
    Country.delete_all    

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
    :username => 'helenatxu', 
    :email => 'helenatxu@gmail.com', 
    :photo_url => '/images/rails.png' 
    )

    User.create(
    :username => 'julas', 
    :email => 'julas@julas.com', 
    :photo_url => '/images/rails.png' 
    )

    User.create(
    :username => 'prueba', 
    :email => 'prueba@gmail.com', 
    :photo_url => '/images/rails.png' 
    )
    
    
    Comment.create(
    :author => 'helenatxu',
    :date => '01/02/2010',
    :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
    a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
    ornare urna, quis pulvinar magna aliquet ac.'
    )

    Comment.create(
    :author => 'julas',
    :date => '02/02/2010',
    :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
    a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
    ornare urna, quis pulvinar magna aliquet ac.'
    )

    Comment.create(
    :author => 'julas',
    :date => '03/02/2010',
    :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
    a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
    ornare urna, quis pulvinar magna aliquet ac.'
    )
    
    Place.create(
    :name => 'Place1', 
    :coordinates_lat => '1.00203013',
    :coordinates_long => '-2.235532',
    :country => '1',
    :date => '01/02/2010',
    :rank => '2',
    :author => 'helenatxu',
    :description => 'Long handle bag made of skin. Including that based portfolio - Removable inner wallet. Dimensions: 25 x 36 12 cms.',
    :image_url => '/images/rails.png'
    )

    Place.create(
    :name => 'Place2', 
    :coordinates_lat => '1.00203013',
    :coordinates_long => '-2.235532',
    :country => '2',
    :date => '01/02/2010',
    :rank => '5',
    :author => 'julas',
    :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
    a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
    ornare urna, quis pulvinar magna aliquet ac.',
    :image_url => '/images/rails.png'
    )

    Place.create(
    :name => 'Place3', 
    :coordinates_lat => '4.00203013',
    :coordinates_long => '-5.235532',
    :country => '1',
    :date => '01/06/2010',
    :rank => '1',
    :author => 'prueba',
    :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
    a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
    ornare urna, quis pulvinar magna aliquet ac.',
    :image_url => '/images/rails.png'
    )

    Route.create(
    :name => 'Route1', 
    :date => '01/02/2010',
    :rank => '3',
    :author => 'helenatxu',
    :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
    a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
    ornare urna, quis pulvinar magna aliquet ac.',
    :places => '1'
    )

    Route.create(
    :name => 'Route2', 
    :date => '10/02/2010',
    :rank => '2',
    :author => 'julas',
    :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
    a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
    ornare urna, quis pulvinar magna aliquet ac.',
    :places => '3'
    )

    Route.create(
    :name => 'Route3', 
    :date => '01/05/2010',
    :rank => '5',
    :author => 'helenatxu',
    :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
    a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
    ornare urna, quis pulvinar magna aliquet ac.',
    :places => '2'
    )


    # . . . 

  end 

  def self.down

    User.delete_all 
    Place.delete_all 
    Route.delete_all 
    Comment.delete_all

  end

end
