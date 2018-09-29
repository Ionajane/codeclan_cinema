require_relative("./models/customer.rb")
require_relative("./models/film.rb")
require_relative("./models/ticket.rb")
require('pry')

#--
  customer1 = Customer.new({
    "name" => "Jordan Pollock",
    "funds" => 12
    })

  customer1 = Customer.new({
    "name" => "Calum MacKinnon",
    "funds" => 10
    })
#--
  film1 = Film.new ({
    "title" => "King of Thieves",
    "price" => 10
    })

  film2 = Film.new ({
    "title" => "A Simple Favor",
    "price" => 8
    })
#--
  ticket1 = Ticket.new ({
    "customer_id" => customer1.id,
    "film_id" => film1.id
    })

  ticket2 = Ticket.new ({
    "customer_id" => customer2.id,
    "film_id" => film2.id
    })
#--
binding.pry
Going to the movies
