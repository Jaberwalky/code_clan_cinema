require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @title = params['title']
    @price = params['price']
  end

  def self.delete_all()
    SqlRunner.run("DELETE FROM films;")
  end

  def self.all()
    sql = "SELECT * FROM films;"
    Film.return_many(sql)
  end   

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{title}', #{price}) RETURNING id;"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ('#{title}', #{price}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.return_many(sql)
    films = SqlRunner.run(sql)
    films.map {|film| Film.new(film)}
  end

end