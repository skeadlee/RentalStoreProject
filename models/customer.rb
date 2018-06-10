require_relative('../db/sqlRunner')

class Customer

  attr_accessor :id, :first_name, :last_name, :email, :tel_number

  def initialize( options )
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @email = options['email']
    @tel_number = options['tel_number'].to_i
    #@rental = options ['rental']
  end

  def save() #save customers to database
    sql = "INSERT INTO customers (first_name, last_name, email, tel_number) VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@first_name, @last_name, @email, @tel_number]
    customer_data = SqlRunner.run(sql, values)
    @id = customer_data.first()['id'].to_i
  end

  def full_name() #joins first and last names
    return "#{@first_name} #{@last_name}"
  end

  def self.all() #view all customers - Customer.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run( sql )
    result = customers.map { |customer| Customer.new( customer ) }
    return result
  end

  def self.find( id ) #find a specific customer by their id - Customer.find()
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    customer = SqlRunner.run( sql, values )
    result = Customer.new( customer.first )
    return result
  end

  def self.find_by_email( email ) #find a specific customer by their email
    sql = "SELECT * FROM customers WHERE email = $1"
    values = [email]
    customer = SqlRunner.run( sql, values )
    result = Customer.new( customer.first )
    return result
  end

  def update() #updates customer details in database
    sql = "UPDATE customers SET (first_name,last_name, email, tel_number) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@first_name, @last_name, @email, @tel_number, @id]
    SqlRunner.run( sql, values )
  end

  def self.delete(id) #delete an individual customer - Customer.delete(id)
    sql = "DELETE FROM customers WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all() #deletes all customers -  Customer.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def rentals() #returns an array of rentals for a specific customer
    sql = "SELECT * FROM stock INNER JOIN rentals ON stock.id = rentals.stock_id WHERE customer_id = $1"
    values = [@id]
    results = SqlRunner.run( sql, values )
    rentals = results.map { |item| Stock.new( item ) }
    return rentals
  end

end
