require_relative '../models/customer.rb'
require_relative '../models/film.rb'
require_relative '../models/ticket.rb'

require 'pry-byebug'

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({'name' => "Paul Jablonski", "funds" => 50 })
customer1.save()





film1 = Film.new({"title" => "Guardians of the Galaxy - Vol 2", "price" => 9.20})
film1.save()

ticket1 = Ticket.new({"customer_id" => customer1.id, "film_id" => film1.id})
ticket1.save()














binding.pry
nil