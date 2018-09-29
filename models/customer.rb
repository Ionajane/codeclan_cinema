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

   end

   def self.all

   end

   def update()

   end

   def self.delete_all()

   end

 end
