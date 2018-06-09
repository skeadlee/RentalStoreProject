require_relative('../db/sqlRunner')

class Stock

  attr_accessor :id, :type, :colour, :size, :price, :quantity

  def initialize( options )
    @id = options['id'].to_i
    @type = options['type']
    @colour = options['colour']
  #  @size = options['size']
    @price = options['price'].to_i
    @quantity = options['quantity'].to_i
  end

  def save() #save stock item to database
    sql = "INSERT INTO stock (type, colour, price, quantity) VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@type, @colour, @price, @quantity]
    stock_data = SqlRunner.run(sql, values)
    @id = stock_data.first()['id'].to_i
  end

  def self.all() #view all stock - Stock.all()
    sql = "SELECT * FROM stock"
    stock_items = SqlRunner.run( sql )
    result = stock_items.map { |stock| Stock.new( stock ) }
    return result
  end


  def self.find( id ) #find a specific item of stock by its id - Stock.find()
    sql = "SELECT * FROM stock WHERE id = $1"
    values = [id]
    stock = SqlRunner.run( sql, values )
    result = Stock.new( stock.first )
    return result
  end

  def update() #updates stock details in database
    sql = "UPDATE stock SET (type, colour, price, quantity) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@type, @colour, @price, @quantity, @id]
    SqlRunner.run( sql, values )
  end

  def delete() #delete a specific item of stock
    sql = "DELETE FROM stock WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all() #deletes all stock -  Stock.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def customer() #returns a Customer object, an instance of the Customer class
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [@customer_id]
    results = SqlRunner.run( sql, values )
    customer_data = results[0]
    customer = Customer.new( customer_data )
    return customer
  end

end
