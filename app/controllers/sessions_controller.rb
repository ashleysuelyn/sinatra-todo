get '/login' do
	erb :"sessions/new"	
end

post '/login' do
	@user = User.find_by(email: params[:email])
	if @user.password == params[:password]
		session[:user_id] = @user.id
		redirect "/todos"
	end
	erb :"sessions/new"
end

post '/logout' do
	session[:user_id] = nil
	redirect "/login"
end