require './models/user'

get '/users/new' do

    erb :'users/new', locals: {
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
