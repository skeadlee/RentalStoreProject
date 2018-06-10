require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/customer_controller')

configure do
  enable :method_override
end

get '/' do #home page view
  erb( :"customer_views/home" )
end
