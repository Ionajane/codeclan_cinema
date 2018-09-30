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

   end

   def self.delete_all()
     sql = "DELETE FROM customers;"
     SqlRunner.run(sql)
   end

 end
