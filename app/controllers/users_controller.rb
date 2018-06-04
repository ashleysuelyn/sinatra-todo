get '/signup' do
	erb :"users/new"
end

post '/signup' do
	@user = User.new(name: params[:name], email: params[:email], password: params[:password])
	if @user.save
		redirect "/login"
	end
	erb :"users/new"
end