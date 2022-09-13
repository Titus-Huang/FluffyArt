require 'sinatra'
require 'httparty'
require 'dotenv/load'

get '/' do
    # HTTParty.get("https://ombdapi.com?apikey=#{ENV['OMDB_API_KEY']}&t=jaws").to_s

    page_title = "test title"

    page_title = 
    erb :index, locals: {
        page_title: page_title
    }
end
