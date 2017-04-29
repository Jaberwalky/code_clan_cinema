require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @funds = params['funds']
  end

  def self.delete_all()
    SqlRunner.run("DELETE FROM customers;")
  end

  def self.all()
    sql = "SELECT * FROM customers;"
    self.return_many(sql)
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{name}', #{funds}) RETURNING id;"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customer SET (name, funds) = ('#{name}, #{funds}) WHERE id = #{@id};"
    Sql_runner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.return_many(sql)
    customers = SqlRunner.run(sql)
    customers.map {|customer| Customer.new(customer)}
  end

end