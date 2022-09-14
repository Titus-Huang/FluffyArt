require './models/user'

get '/users/new' do
    site_render = erb(:'shared/nav', layout: false) + erb(:'users/new', layout: false) + erb(:'shared/footer', layout: false)
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

post '/users/:id' do
    id = params['id']

    site_render = erb(:'shared/nav', layout: false) + erb(:'users/profile', layout: false) + erb(:'shared/footer', layout: false)
    erb site_render, locals: {
        page_title: "#{find_user_by_id(id)['username']} - Profile"
    }
end
