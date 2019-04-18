require_relative('models/star')
require_relative('models/movie')
require_relative('models/casting')

require( 'pry-byebug' )

Star.delete_all()

star1 = Star.new({ 'first_name' => 'Marlon', 'last_name' => 'Brando'})
star2 = Star.new({ 'first_name' => 'Al', 'last_name' => 'Pachino'})

star1.save()
star2.save()




binding.pry
nil
