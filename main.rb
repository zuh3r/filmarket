require 'sinatra'

development?
require 'sinatra/reloader'

require_relative 'db/db'

get '/' do
  erb :index
end





