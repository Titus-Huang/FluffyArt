require './main'

Cloudinary.config_from_url("cloudinary://#{ENV['API_KEY']}:#{ENV['API_SECRET']}@#{ENV['CLOUD_NAME']}")
Cloudinary.config do |config|
    config.secure = true
end

run Sinatra::Application
