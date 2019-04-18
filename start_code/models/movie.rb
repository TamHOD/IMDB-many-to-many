require_relative("../db/sql_runner")

require_relative("star")

class Movie

attr_reader :id
attr_accessor :title, :genre

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO movies
    (
      title, genre
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@title, @genre]
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM movies"
    movies = SqlRunner.run(sql)
    return self.map_items(movies)
  end

  def self.map_items(movie_data)
    results = movie_data.map { |movie| Movie.new(movie) }
    return results
  end

  def self.delete_all()
    sql = "DELETE from movies"
    SqlRunner.run(sql)
  end

  def stars
    sql = "SELECT stars.* FROM stars
    INNER JOIN castings
    ON castings.star_id = stars.id
    WHERE castings.movie_id = $1"
    values =[@id]
    stars = SqlRunner.run(sql, values)
    results = stars.map { |star| Star.new(star) }
    return results
  end

end
