require 'sinatra'
require 'bcrypt'
require 'httparty'
require 'dotenv/load'
require 'pg'

require './db/db'

# Landing page
get '/' do
    # HTTParty.get("https://ombdapi.com?apikey=#{ENV['OMDB_API_KEY']}&t=jaws").to_s


    erb :index, locals: {
        page_title: "Home"
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
