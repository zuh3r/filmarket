get '/gallery' do
    user_id = session["user_id"]
    user = find_user_by_id(user_id)
    user_email = find_email_by_id(user_id)
    balance = find_balance_by_id(user_id)

    if logged_in?
    gallery_images = get_gallery_images(user_email['email'])
    user_name = user["first_name"]
    end
    erb :'gallery/index', locals: {
        gallery_images: gallery_images,
        balance: balance,
        user_name: user_name
    }
end


get '/gallery/new' do
    gallery_image_id = params["id"]
    user_id = session["user_id"]
    current_user = find_user_by_id(user_id)
    email = params["email"]

    erb :'gallery/new', locals: {
        gallery_image_id: gallery_image_id,
        current_user: current_user,
        email: email
    }
end

post '/new_art' do
    name = params["name"]
    image_url = params["image_url"]
    artist = params["artist"]
    caption = params["caption"]
    price = params["price"]
    user_id = session["user_id"]
    email = find_email_by_id(user_id)
    
    create_gallery_images(name, image_url, artist, caption, price, email['email'])
    redirect '/gallery'
end

# put '/gallery/:id' do
#     id = params["id"]
#     name = params["name"]
#     caption = params["caption"]
#     price = params["price"]

#     update_gallery_images(id, name, caption, price)
#     redirect '/gallery'
# end

put '/sell/:id' do
    gallery_image_id = params["id"]
    gallery_image_price = gallery_image_price(gallery_image_id)
    user_id = session["user_id"]
    new_price = params["new_price"]
    user_email = find_email_by_id(user_id)

    sell_gallery_images(gallery_image_id, new_price, user_email["email"])
    
    redirect '/gallery'
  end