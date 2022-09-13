require 'sinatra'
require 'httparty'
require 'dotenv/load'
require 'pg'

require './db/db'

# Landing page
get '/' do
    # HTTParty.get("https://ombdapi.com?apikey=#{ENV['OMDB_API_KEY']}&t=jaws").to_s

    page_title = "test title"

    erb :index, locals: {
        page_title: page_title
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
