get '/marketplace' do

  sale_images = all_sale_images()

  erb :'marketplace/index', locals: {
    sale_images: sale_images
  }
end

