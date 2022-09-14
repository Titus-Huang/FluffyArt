require './models/content'

# get '/contents' do
#     "Woah, hello content!!!"
# end


get '/contents' do
    contents = all_contents()

    erb :'contents/index', locals: {
        page_title: "Gallery view",
        contents: contents
    }
end

# get '/foods/new' do
#     erb :'foods/new'
# end

# post '/foods' do
#     name = params['name']
#     image_url = params['image_url']

#     create_food(name, image_url)

#     # if the request is NOT a GET request, then we must redirect instead of using erb.
#     redirect '/'
# end

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
