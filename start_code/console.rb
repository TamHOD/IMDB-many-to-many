require_relative('models/star')
require_relative('models/movie')
require_relative('models/casting')

require( 'pry-byebug' )

Casting.delete_all()
Star.delete_all()
Movie.delete_all()


star1 = Star.new({ 'first_name' => 'Marlon', 'last_name' => 'Brando'})
star2 = Star.new({ 'first_name' => 'Al', 'last_name' => 'Pachino'})

star1.save()
star2.save()

movie1 = Movie.new({'title' => 'The Godfather', 'genre' => 'OG'})
movie2 = Movie.new({'title' => 'The Godfather Part II', 'genre' => 'OG'})
movie3 = Movie.new({'title' => 'A Street-Car Named Desire', 'genre' => 'Drama'})

movie1.save
movie2.save
movie3.save

casting1 = Casting.new({'star_id' => star1.id, 'movie_id' => movie1.id, 'fee' => 20})
casting2 = Casting.new({'star_id' => star2.id, 'movie_id' => movie1.id, 'fee' => 12})
casting3 = Casting.new({'star_id' => star1.id, 'movie_id' => movie3.id, 'fee' => 11})
casting4 = Casting.new({'star_id' => star2.id, 'movie_id' => movie2.id, 'fee' => 21})

casting1.save
casting2.save
casting3.save
casting4.save

binding.pry
nil
