require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/stock')
also_reload('../models/*')

get '/stock' do #view all stock
  @stock = Stock.all()
  erb( :"/stock_views/stock" )
end
