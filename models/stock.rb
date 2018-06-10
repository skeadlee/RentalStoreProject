require_relative('../db/sqlRunner')

class Stock

  attr_accessor :id, :type, :colour, :size, :price, :quantity

  def initialize( options )
    @id = options['id'].to_i
    @type = options['type']
    @colour = options['colour']
    #@size = options['size']
    @price = options['price'].to_i
    #@quantity = options['quantity'].to_i
  end

  def save() #save stock item to database
    sql = "INSERT INTO stock (type, colour, price) VALUES ($1, $2, $3) RETURNING *"
    values = [@type, @colour, @price]
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
    sql = "UPDATE stock SET (type, colour, price) = ($1, $2, $3) WHERE id = $4"
    values = [@type, @colour, @price, @id]
    SqlRunner.run( sql, values )
  end

  def self.delete(id) #delete a specific item of stock - Stock.delete(id)
    sql = "DELETE FROM stock WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all() #deletes all stock -  Stock.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def is_available() #checks if item is avalable for rentals
    sql = "SELECT * FROM rentals WHERE stock_id = $1"
    values = [@id]
    rental_data = SqlRunner.run( sql, values)
    return rental_data.count == 0 #if returns 0 from rentals, then item available for rental as not currently hired
  end

  def rent_to_customer(customer_id) #rent an item of stock to a customer if available
    if is_available()
      sql = "INSERT INTO rentals (customer_id, stock_id) VALUES ($1, $2) RETURNING *"
      values = [customer_id, @id]
      rental_data = SqlRunner.run(sql, values)
      return rental_data.first()['id'].to_i
    end
  end

  def self.rentals() #returns an array of all the stock currently rented - Stock.rentals()
    sql = "SELECT * FROM stock INNER JOIN rentals ON stock.id = rentals.stock_id"
    results = SqlRunner.run( sql )
    rentals = results.map { |item| Stock.new( item ) }
    return rentals
  end


end
