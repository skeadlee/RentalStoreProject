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
