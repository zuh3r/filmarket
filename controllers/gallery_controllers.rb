get '/gallery' do
    erb :
end


get '/gallery/new' do
    erb :'gallery/new'
  end

  post '/new_art' do
    name = params["name"]
    image_url = params["image_url"]
    artist = params["artist"]
    caption = params["caption"]
    price = params["price"]
    
    create_gallery_images(name, image_url, artist, caption, price)
    redirect '/gallery'
  end

  put 'gallery/:id' do
    id = params["id"]
    name = params["name"]
    caption = params["caption"]
    price = params["price"]

    update_gallery_images(id, name, caption, price)
    redirect '/gallery'
  end
  