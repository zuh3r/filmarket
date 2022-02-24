get '/login' do
    erb :'sessions/new'
  end

post '/sessions' do
    email = params["email"]
    password = params["password"]

    user = find_user_by_email(email)

    if user && BCrypt::Password.new(user['password_digest']) == params['password']
        session['user_id'] = user['id']
        redirect '/marketplace'
    else
        # wrong pw = true -> run if statement in erb to show error message
        redirect '/login'
    end
end

delete '/sessions' do
    session['user_id'] = nil
    redirect '/marketplace'
end