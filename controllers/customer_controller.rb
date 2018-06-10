require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/customer')
also_reload('../models/*')

get '/customers' do #view all customers
  @customers = Customer.all()
  erb( :"/customer_views/customers" )
end

get '/customers/:id' do #show specific customer
  @customer = Customers.find(params[:id])
  erb(:"customer_views/show")
end

get '/customers/new' do #go to add a new customer page
  erb( :"customer_views/new_customer" )
end

post '/customers' do #post new customer and show in customers page
  @customer = Customer.new(params)
  @customer.save()
  redirect '/customers'
end

get '/customers/:id/edit' do #find (get) customer in order to update
  @customer = Customer.find(params[:id])
  erb(:"customer_views/edit")
end

post '/customers/:id/update' do #(post) updates to existing customer
  @customer = Customer.new(params)
  @customer.update()
  redirect '/customers'
end

#This doesn't work! I've googled some stuff and tried some things - see customers.erb
delete 'customers/:id/delete' do #delete a specific customer
  @customer = Customer.find(params[:id])
  @customer.delete()
  redirect '/customers'
end

get '/stock' do #view all stock
  erb( :stock )
end

get '/rentals' do #view all rentals
  erb( :rentals)
end
