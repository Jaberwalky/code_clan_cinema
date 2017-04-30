require_relative("../db/sql_runner")

class Screening

  attr_reader :id
  attr_accessor :film_id, :showtime

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @film_id = params['film_id'].to_i
    @showtime = params['showtime']
  end

  def self.delete_all()
    SqlRunner.run("DELETE FROM screenings;")
  end

  def save()
    sql = "INSERT INTO screenings (film_id, showtime) VALUES (#{film_id}, '#{showtime}') RETURNING id;"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end
end