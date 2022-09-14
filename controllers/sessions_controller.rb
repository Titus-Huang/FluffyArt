
get '/sessions/new' do

    site_render = erb(:'shared/nav', layout: false) + erb(:'sessions/new', layout: false)
    erb site_render, locals: {
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
    
    puts ">>> WARNING: Log-in failed <<<"
end

delete '/sessions' do
    session['user_id'] = nil

    redirect '/'
end
