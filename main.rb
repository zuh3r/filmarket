require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'bcrypt'

enable :sessions

require_relative 'db/db'

require_relative 'models/gallery'
require_relative 'models/marketplace'
require_relative 'models/user'

require_relative 'controllers/gallery_controllers'
require_relative 'controllers/homepage_controllers'
require_relative 'controllers/marketplace_controllers'
require_relative 'controllers/sessions_controllers'
require_relative 'controllers/user_controllers'

require_relative 'helpers/sessions_helper'
