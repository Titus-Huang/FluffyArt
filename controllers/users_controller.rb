require './models/user'

get '/users/new' do

    site_render = erb(:'shared/nav', layout: false) + erb(:'users/new', layout: false)
    erb site_render, locals: {
        page_title: "Create new account"
    }
end


post '/users' do
    username = params['username']
    email = params['email']
    password = params['password']

    create_user(username, email, password)

    redirect '/'
end
