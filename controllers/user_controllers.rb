get '/sign_up' do
  
    erb :'users/new'
  end
  
  post '/users' do
    first_name = params['first_name']
    last_name = params['last_name']
    email = params['email']
    password = params['password']
    balance = params['balance']
  
    create_user(first_name, last_name, email, password, balance)
  
    redirect '/marketplace'
  end