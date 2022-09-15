require './models/user'

get '/profiles' do
    profiles = get_users_by_id()

    site_render = erb(:'shared/nav', layout: false) + erb(:'users/profiles', layout: false, locals: { profiles: profiles }) + erb(:'shared/footer', layout: false)
    erb site_render, locals: {
        page_title: "All Profiles"
    }
end

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

get '/users/edit' do
    id = session['user_id']
    profile_data = find_user_by_id(id)

    site_render = erb(:'shared/nav', layout: false) + erb(:'users/edit', layout: false, locals: { profile_data: profile_data }) + erb(:'shared/footer', layout: false)
    erb site_render, locals: {
        page_title: "Edit Profile"
    }
end

post '/users/edit/:id' do
    id = params['id']
    profile_picture = params['profile_picture']
    
    # profile picture uploaded
    image_upload = Cloudinary::Uploader.upload(profile_picture['tempfile'],
        :folder => "fluffyart-cdn/#{id}/",
        :use_filename => true,
        :overwrite => true,
        :resource_type => "image")
    puts "Profile picture has been uploaded to Cloudinary"
    p image_upload

    update_profile_image_url(image_upload['secure_url'], id)

    redirect "/users/#{id}"
end

get '/users/:id' do
    id = params['id']
    profile_data = find_user_by_id(id)
    content_posted = get_contents_by_user_id(id)

    site_render = erb(:'shared/nav', layout: false) + erb(:'users/profile', layout: false, locals: { profile_data: profile_data, content_posted: content_posted }) + erb(:'shared/footer', layout: false)
    erb site_render, locals: {
        page_title: "#{profile_data['username']} - Profile"
    }
end
