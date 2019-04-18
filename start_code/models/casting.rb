class Casting

  attr_reader :id
  attr_accessor :star_id, :movie_id, :fee

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @star_id = options['star_id']
    @movie_id = options['movie_id']
    @fee = options['fee']
  end

  def save()
    sql = "INSERT INTO castings
    (
      star_id, movie_id, fee
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@star_id, @movie_id, @fee]
    casting = SqlRunner.run(sql, values).first
    @id = casting['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM castings"
    castings = SqlRunner.run(sql)
    return self.map_items(castings)
  end

  def self.map_items(casting_data)
    results = casting_data.map { |casting| Casting.new(casting) }
    return results
  end

  def self.delete_all()
    sql = "DELETE from castings"
    SqlRunner.run(sql)
  end

end
