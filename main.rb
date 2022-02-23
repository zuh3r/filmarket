require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?

enable :sessions

require_relative 'db/db'

require_relative 'models/photo'
require_relative 'models/user'

require_relative 'controllers/photo_controllers'
require_relative 'controllers/sessions_controllers'
require_relative 'controllers/user_controllers'

require_relative 'helpers/sessions_helper'
