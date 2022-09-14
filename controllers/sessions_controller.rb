
get '/sessions/new' do
    erb :'sessions/new', locals: {
        page_title: "Log in"
    }
end

post '/sessions' do
    username = params['username']
    password = params['password']

    user = find_user_by_username(username)

    if user && BCrypt::Password.new(user['password_digest']) == password
        session['user_id'] = user['id']

        redirect '/'
    end
end

delete '/sessions' do
    session['user_id'] = nil

    redirect '/'
end
