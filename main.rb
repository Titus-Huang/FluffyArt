require 'sinatra'
require 'bcrypt'
require 'httparty'
require 'dotenv/load'
require 'pg'
require 'cloudinary'

require './db/db'

# this makes the session hash work
enable :sessions

# Landing page
get '/' do
    username = 
    erb :index, locals: {
        page_title: "Welcome"
    }
end

# User-related routes
require './controllers/users_controller'
# Content-related routes
require './controllers/contents_controller'
# Session-related routes
require './controllers/sessions_controller'

# Session Helper
require './helpers/sessions_helper'
