get '/marketplace' do
  user_id = session["user_id"]
  sale_images = all_sale_images()
  balance = find_balance_by_id(user_id)
  user = find_user_by_id(user_id)

  if logged_in?
    user_name = user["first_name"]
  else
    nil
  end

  erb :'marketplace/index', locals: {
    sale_images: sale_images,
    balance: balance,
    user_name: user_name
  }
end

  put '/buy/:id' do
    user_id = session["user_id"]
    marketplace_image_id = params["id"]
    marketplace_image_price = marketplace_image_price(marketplace_image_id)
    user_email = find_email_by_id(user_id)
    balance = find_balance_by_id(user_id)

    if balance["balance"].to_i > marketplace_image_price["price"].to_i
      purchase_sale_images(marketplace_image_id, user_email["email"], marketplace_image_price["price"])
      redirect '/gallery'
    else
      redirect '/balance'
    end
  end