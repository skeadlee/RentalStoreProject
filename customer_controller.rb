require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('./models/customer')
also_reload('models/*')

get '/' do
  erb( :home )
end

get '/customers' do
  erb( :customers )
end

get '/stock' do
  erb( :stock )
end

get '/rentals' do
  erb( :rentals)
end
