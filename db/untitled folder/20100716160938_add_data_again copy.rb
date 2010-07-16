class AddDataAgain < ActiveRecord::Migration
  def self.up

  down   

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
  :hashed_password => '1234', 
  :profile => 'Hi! I am from Spain. I like travel. Nice to meet you!',
  :photo_url => '/images/autocaravana1.jpg',
  :is_admin => true
  )

  User.create(
  :username => 'julas', 
  :email => 'julas@julas.com',
  :hashed_password => '1234', 
  :profile => 'Hi! I like travel. Nice to meet you!',
  :photo_url => '/images/rails.png',
  :is_admin => true
  )

  User.create(
  :username => 'prueba', 
  :email => 'prueba@gmail.com', 
  :hashed_password => '1234', 
  :profile => 'Hi! I am from Spain. Nice to meet you!',
  :photo_url => '/images/autocaravana2.jpg',
  :is_admin => false
  )

  User.create(
  :username => 'pepe', 
  :email => 'pepe@gmail.com',
  :hashed_password => '1234', 
  :profile => 'Hi! I am from France. I like travel.',
  :photo_url => '/images/rails.png',
  :is_admin => false
  )

  User.create(
  :username => 'juan', 
  :email => 'juan@julas.com',
  :hashed_password => '1234', 
  :profile => 'Hi! I am from Poland. I like travel. Nice to meet you!',
  :photo_url => '/images/autocaravana2.jpg',
  :is_admin => false
  )

  User.create(
  :username => 'maria', 
  :email => 'maria@gmail.com', 
  :hashed_password => '1234', 
  :profile => 'Hi! I am from Portugal. I like travel. Nice to meet you!',
  :photo_url => '/images/autocaravana1.jpg',
  :is_admin => false
  )


  Comment.create(
  :date => '01/02/2010',
  :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
  a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
  ornare urna, quis pulvinar magna aliquet ac.'
  )

  Comment.create(
  :date => '02/02/2010',
  :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
  a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
  ornare urna, quis pulvinar magna aliquet ac.'
  )

  Comment.create(
  :date => '03/03/2010',
  :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
  a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
  ornare urna, quis pulvinar magna aliquet ac.'
  )

  Comment.create(
  :date => '03/04/2010',
  :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
  a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
  ornare urna, quis pulvinar magna aliquet ac.'
  )

  Comment.create(
  :date => '03/05/2010',
  :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
  a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
  ornare urna, quis pulvinar magna aliquet ac.'
  )

  Comment.create(
  :date => '03/06/2010',
  :comment => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
  a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
  ornare urna, quis pulvinar magna aliquet ac.'
  )

  Place.create(
  :name => 'Place1', 
  :coordinates_lat => '1.00203013',
  :coordinates_long => '-2.235532',
  :direction => 'ul. Piotrkowska, nº 2, Lodz, Polska',
  :country => '2',
  :date => '01/02/2010',
  :rank => '2',
  :description => 'Long handle bag made of skin. Including that based portfolio - Removable inner wallet. Dimensions: 25 x 36 12 cms.',
  :image_url => '/images/autocaravana1.jpg',
  :comments => '1'
  )

  Place.create(
  :name => 'Place2', 
  :coordinates_lat => '1.00203013',
  :coordinates_long => '-2.235532',
  :direction => 'C/ Pintor Manuel Siguenza, nº6, Piedo, Valencia',
  :country => '1',
  :date => '01/02/2010',
  :rank => '5',
  :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
  a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
  ornare urna, quis pulvinar magna aliquet ac.',
  :image_url => '/images/autocaravana2.jpg',
  :comments => '2'
  )

  Place.create(
  :name => 'Place3', 
  :coordinates_lat => '4.00203013',
  :coordinates_long => '-5.235532',
  :direction => 'C/ del Mar, nº2, Valencia',
  :country => '1',
  :date => '01/06/2010',
  :rank => '1',
  :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
  a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
  ornare urna, quis pulvinar magna aliquet ac.',
  :image_url => '/images/autocaravana1.jpg',
  :comments => '3'
  )

  Route.create(
  :name => 'Route1', 
  :date => '01/02/2010',
  :rank => '3',
  :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
  a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
  ornare urna, quis pulvinar magna aliquet ac.',
  :places => '1',
  :comments => '4'
  )

  Route.create(
  :name => 'Route2', 
  :date => '10/02/2010',
  :rank => '2',
  :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
  a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
  ornare urna, quis pulvinar magna aliquet ac.',
  :places => '3',
  :comments => '5'
  )

  Route.create(
  :name => 'Route3', 
  :date => '01/05/2010',
  :rank => '5',
  :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed urna felis, 
  a elementum risus. Nulla in egestas justo. Integer eleifend, dui in gravida condimentum, 
  ornare urna, quis pulvinar magna aliquet ac.',
  :places => '2',
  :comments => '6'
  )


  # . . . 

end 

def self.down

  User.delete_all 
  Place.delete_all 
  Route.delete_all 
  Comment.delete_all
  Country.delete_all
  Rating.delete_all

  drop_table :ratings

end

end

