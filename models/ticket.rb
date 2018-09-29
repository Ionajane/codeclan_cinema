require_relative("../db/sql_runner.rb")

class Ticket

  attr_accessor :customer_id, :film_id

  def initialize(options)
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
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
