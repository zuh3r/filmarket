get '/sign_up' do
  erb :'users/new_user'
end
  
post '/users' do
  first_name = params['first_name']
  last_name = params['last_name']
  email = params['email']
  password = params['password']

  if email != '' && password != '' && first_name != '' && last_name != ''
    create_user(first_name, last_name, email, password)
    redirect '/marketplace'
  else
    redirect '/sign_up'
  end
end

get '/balance' do
  user_id = session["user_id"]
  balance = find_balance_by_id(user_id)

  erb :'users/balance', locals: {
    user_id: user_id,
    balance: balance
  }
end

put '/balance/deposit' do
  user_id = session["user_id"]
  add_balance = params["add_balance"]

  add_balance(add_balance, user_id)
  redirect '/balance'
end

put '/balance/withdraw' do
  user_id = session["user_id"]
  withdraw_balance = params["withdraw_balance"]
  balance = find_balance_by_id(user_id)

  if balance["balance"].to_i > withdraw_balance.to_i
    withdraw_balance(withdraw_balance, user_id)
    redirect '/balance'
  else
    redirect '/balance'
  end
end