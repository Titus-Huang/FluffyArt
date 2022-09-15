require './models/content'


get '/contents' do
    contents = all_contents()

    site_render = erb(:'shared/nav', layout: false) + erb(:'contents/index', layout: false, locals: { contents: contents }) + erb(:'shared/footer', layout: false)
    erb site_render, locals: {
        page_title: "Gallery view"
    }
end

get '/contents/new' do

    site_render = erb(:'shared/nav', layout: false) + erb(:'contents/new', layout: false) + erb(:'shared/footer', layout: false)
    erb site_render, locals: {
        page_title: "Post content"
    }
end

post '/contents' do
    user_id = session['user_id']

    # print "session ==> "
    # p session
    # p user_id

    if user_id == nil
        # puts ">>> ERROR: Unable to post content, not logged in <<<"
        # redirect '/contents'

        # # temporary until things are ready
        # user_id = 1
    end

    title = params['title']
    content = params['content']
    content_description = params['content_description']
    content_type = params['content_type']

    is_html = false
    is_image = false
    if content_type == "image"
        is_image = true
        image_upload = Cloudinary::Uploader.upload(content['tempfile'],
            :folder => "fluffyart-cdn/#{user_id}/",
            :use_filename => true,
            :overwrite => true,
            :resource_type => "image")
        puts "Images has been uploaded to Cloudinary"
        p image_upload
        content = image_upload['secure_url']
    elsif content_type == "html"
        is_html = true
    end

    create_content(user_id, title, content, content_description, is_image, is_html)

    redirect '/contents'
end

get '/contents/view/:id' do
    id = params['id']
    content = get_content(id)

    site_render = erb(:'shared/nav', layout: false) + erb(:'contents/view', layout: false, locals: { content: content }) + erb(:'shared/footer', layout: false)
    erb site_render, locals: {
        page_title: content['title']
    }
end

get '/contents/:id/edit' do
    id = params['id']
    content = get_content(id)

    if content['is_image'] == "t" && content['is_html'] == "f"
        content_type_value = "image"
    elsif content['is_image'] == "f" && content['is_html'] == "t"
        content_type_value = "html"
    else
        content_type_value = "text"
    end
    
    p content['id']

    site_render = erb(:'shared/nav', layout: false) + erb(:'contents/edit', layout: false, locals: { content: content, content_type_value: content_type_value }) + erb(:'shared/footer', layout: false)
    erb site_render, locals: {
        content: content,
        page_title: "Editing #{content['title']}"
    }
end

put '/contents/:id' do
    user_id = session['user_id']

    # if user_id == nil
    #     # temporary until things are ready, as this will only be allowed to be accessed by the user who created this content
    #     user_id = 1
    # end

    id = params['id']
    title = params['title']
    content = params['content']
    content_description = params['content_description']
    content_type = params['content_type']

    is_html = false
    is_image = false
    if content_type == "image"
        is_image = true
        content = get_content(id)['content']
    elsif content_type == "html"
        is_html = true
    end

    update_content(id, title, content, content_description, is_image, is_html)

    redirect '/contents'
end

delete '/contents/:id' do
    id = params['id']

    delete_content(id)

    redirect '/contents'
end

# post '/foods/:id/likes' do
#     food_id = params['id']
#     user_id = session['user_id']

#     run_sql("INSERT INTO likes(user_id, food_id) VALUES ($1, $2)", [user_id, food_id])

#     redirect '/'
# end
