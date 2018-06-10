require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/customer_controller')
require_relative('controllers/stock_controller')

configure do
  enable :method_override
end

get '/' do #home page view
  erb( :"/home" )
end
