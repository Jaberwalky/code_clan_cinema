class Customer

  attr_reader :id, :name, :funds

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @funds = params['funds']
  end




end