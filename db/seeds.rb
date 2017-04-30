require_relative '../models/customer.rb'
require_relative '../models/film.rb'
require_relative '../models/ticket.rb'
require_relative '../models/screening.rb'

require 'pry-byebug'

Screening.delete_all()
Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

# -----------------------------

customer1 = Customer.new({'name' => "Paul Jablonski", "funds" => 50 })
customer1.save()

# -----------------------------

film1 = Film.new({"title" => "Guardians of the Galaxy - Vol 2", "price" => 9})

film1.save()

# -----------------------------

ticket1 = Ticket.new({"customer_id" => customer1.id, "film_id" => film1.id})
customer1.pay_for_ticket(film1)
ticket1.save()

# -----------------------------

screening1 = Screening.new({"film_id" => film1.id, "showtime" => "14.00"})
screening1.save()
screening2 = Screening.new({"film_id" => film1.id, "showtime" => "17.00"})
screening2.save()











binding.pry
nil