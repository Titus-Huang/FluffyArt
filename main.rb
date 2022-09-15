require 'sinatra'
require 'bcrypt'
require 'httparty'
require 'dotenv/load'
require 'pg'
require 'cloudinary'

Cloudinary.config_from_url("cloudinary://#{ENV['API_KEY']}:#{ENV['API_SECRET']}@#{ENV['CLOUD_NAME']}")
Cloudinary.config do |config|
    config.secure = true
end

# require './quickstart'

require './db/db'

# this makes the session hash work
enable :sessions

# Landing page
get '/' do
    username = ""

    site_render = erb(:'shared/nav', layout: false) + erb(:index, layout: false, locals: { contents: latest_5_contents }) + erb(:'shared/footer', layout: false)
    erb site_render, locals: {
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
