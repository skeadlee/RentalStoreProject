require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/stock')
also_reload('../models/*')


#view all stock, create new stock, delete existing stock, assign stock to customer

get '/stock' do #view all stock
  @stock = Stock.all()
  erb( :"/stock_views/stock" )
end

get '/stock/new' do #go to add a new item of stock page
  erb( :"stock_views/new_stock" )
end

post '/stock' do #create new item of stock and show in stock page
  @stock = Stock.new(params)
  @stock.save()
  redirect '/stock'
end

get '/stock/rentals' do #view all rentals
  @rented_stock = Stock.rentals()
  erb( :"stock_views/rentals")
end

get '/stock/:id' do #show specific item of stock
  @stock = Stock.find(params[:id])
  @customers = Customer.all()
  erb(:"stock_views/show")
end

get '/stock/:id/edit' do #find stock in order to complete an action on it
  @stock = Stock.find(params[:id])
  erb(:"stock_views/edit")
end

post '/stock/:id/delete' do #delete an individual item of stock
  Stock.delete(params[:id])
  redirect to '/stock'
end

post '/stock/:id/rent' do #if item isn't available to hire, displays message.
  @stock = Stock.find(params[:id])
  if @stock.is_available
    @stock.rent_to_customer(params[:customer_id])
    redirect to '/customers/'+params[:customer_id]
  else
    erb(:"stock_views/no_stock")
  end
end

post '/stock/:id/return' do #deletes rented item from rented items
  @stock = Stock.find(params[:id])
  @stock.return_rental_to_stock()
  redirect to '/stock/rentals'
end
