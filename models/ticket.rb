require_relative("../db/sql_runner.rb")

class Ticket

  attr_accessor :customer_id, :film_id

  def initialize(options)
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id)
    VALUES ($1, $2) RETURNING id;"
    values  = [@customer_id, @film_id]
    results = SqlRunner.run(sql, values)
    return results[0]['id'].to_i()
  end

  def self.all
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    results = tickets.map {|ticket| Ticket.new(ticket)}
    return results
  end

  def update()
    sql = "UPDATE tickets SET customer_id = $1, film_id =$2
    WHERE id = $3;"
    values = [@customer_id, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets;"
    SqlRunner.run(sql)
  end

end
