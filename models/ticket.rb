class Ticket

  attr_reader :customer_id, :film_id
  def initialize(params)
    @customer_id = params['customer_id'].to_i
    @film_id = params['film_id'].to_i
  end





end