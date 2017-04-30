require_relative("../db/sql_runner")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @customer_id = params['customer_id'].to_i
    @film_id = params['film_id'].to_i
  end

  def self.delete_all()
    SqlRunner.run("DELETE FROM tickets;")
  end

  def self.all()
    sql = "SELECT * FROM tickets;"
    Ticket.return_many(sql)
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ('#{customer_id}', '#{film_id}') RETURNING id"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_id) = (#{customer_id}, #{film_id}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.return_many(sql)
    tickets = SqlRunner.run(sql)
    tickets.map {|ticket| Ticket.new(ticket)}
  end



end