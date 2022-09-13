require 'sinatra'
require 'httparty'
require 'dotenv/load'


get '/' do
  HTTParty.get("https://ombdapi.com?apikey=#{ENV['OMDB_API_KEY']}&t=jaws").to_s
  erb :index
end
