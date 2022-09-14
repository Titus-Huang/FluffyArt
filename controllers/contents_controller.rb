require './models/content'

# get '/contents' do
#     "Woah, hello content!!!"
# end


get '/contents' do
    contents = all_contents()

    site_render = erb(:'shared/nav', layout: false) + erb(:'contents/index', layout: false, locals: { contents: contents })
    erb site_render, locals: {
        page_title: "Gallery view"
    }
end

get '/contents/new' do

    site_render = erb(:'shared/nav', layout: false) + erb(:'contents/new', layout: false)
    erb site_render, locals: {
        page_title: "Post content"
    }
end

post '/contents' do
    user_id = session['user_id']

    print "session ==> "
    p session
    p user_id

    if user_id == nil
        puts ">>> ERROR: Unable to post content, not logged in <<<"
        redirect '/contents'
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
            :folder => "fluffyart-cdn/img/",
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

    site_render = erb(:'shared/nav', layout: false) + erb(:'contents/view', layout: false, locals: { content: content })
    erb site_render, locals: {
        page_title: content[:title]
    }
end

# # the :id is a route parameter
# get '/foods/:id/edit' do
#     id = params['id']
#     food = get_food(id)
    
#     erb :'foods/edit', locals: {
#         food: food
#     }
# end

# put '/foods/:id' do
#     id = params['id']
#     name = params['name']
#     image_url = params['image_url']

#     update_food(id, name, image_url)

#     redirect '/'
# end

# delete '/foods/:id' do
#     id = params['id']

#     delete_food(id)

#     redirect '/'
# end

# post '/foods/:id/likes' do
#     food_id = params['id']
#     user_id = session['user_id']

#     run_sql("INSERT INTO likes(user_id, food_id) VALUES ($1, $2)", [user_id, food_id])

#     redirect '/'
# end
