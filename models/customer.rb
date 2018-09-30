require_relative("../db/sql_runner.rb")

 class Customer

   attr_reader :id, :name
   attr_accessor :funds

   def initialize(options)
     @id = options['id'].to_i
     @name = options['name']
     @funds = options['funds'].to_i
   end

   def save()
     sql = "INSERT INTO customers(name, funds)
     VALUES ($1, $2) RETURNING id;"
     values = [@name, @funds]
     results = SqlRunner.run(sql, values)
     @id = results[0]['id'].to_i
   end

   def self.all()
     sql = "SELECT * FROM customers;"
     customers = SqlRunner.run(sql)
     result = customers.map {|customer| Customer.new(customer)}
     return result
   end

   def update()
     sql = "UPDATE customers SET name = $1, funds $2
     WHERE id = $3;"
     values = [@name, @funds, @id]
     sqlRunner.run(sql, values)
   end

   def self.delete_all()
     sql = "DELETE FROM customers;"
     SqlRunner.run(sql)
   end

   def films()
     sql = "SELECT * FROM films
     INNER JOIN tickets
     ON tickets.film_id = film.id
     WHERE tickets.customer_id = $1;"
     values = [@id]
     film_info = SqllRunner.run(sql,values)
     return Film.map_items(film_info)
   end

 end
