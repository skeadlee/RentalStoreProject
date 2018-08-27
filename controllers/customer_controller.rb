require('sinatra')
require('sinatra/contrib/all') if development?
# require('sinatra/contrib/all')
# require('pry')
require_relative('../models/customer')
# also_reload('../models/*')

get '/customers' do #view all customers
  @customers = Customer.all()
  erb( :"/customer_views/customers" )
end

get '/customers/new' do #go to add a new customer page
  erb( :"customer_views/new_customer" )
end

get '/customers/:id' do #show specific customer
  @customer = Customer.find(params[:id])
  erb(:"customer_views/show")
end

post '/customers' do #create new customer and show in customers page
  @customer = Customer.new(params)
  @customer.save()
  redirect '/customers'
end

get '/customers/:id/edit' do #find customer in order to update
  @customer = Customer.find(params[:id])
  erb(:"customer_views/edit")
end

post '/customers/:id/update' do #allows user to update existing customer
  @customer = Customer.new(params)
  @customer.update()
  redirect '/customers'
end

post '/customers/:id/delete' do #delete an individual customer
  Customer.delete(params[:id])
  redirect to '/customers'
end

# # #This doesn't work! I've googled some stuff and tried some things - see customers.erb
# delete 'customers/:id/delete' do #delete a specific customer
#   Customer.delete(params[:id])
#   redirect to '/customers'
# end

get '/customers/:id/rentals' do #find/view a specific customers rentals
  @customer = Customer.find(params[:id])
  @rentals = @customer.rentals()
  erb(:"customer_views/rentals")
end
