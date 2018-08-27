require( 'sinatra' )
require('sinatra/contrib/all') if development?
# require( 'sinatra/contrib/all' )
require_relative('controllers/customer_controller') if development?
require_relative('controllers/stock_controller') if development?

# configure do
#   enable :method_override
# end

get '/' do #home page view
  erb( :"/home" )
end
