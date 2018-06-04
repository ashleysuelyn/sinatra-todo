get '/todos' do	
	require_login
	@todos = Todo.where(user_id: session[:user_id])
	erb :"todos/index"
end

get '/todos/new' do
	erb :"todos/new"
end

post '/todos' do
	@todo = Todo.new(title: params[:title], description: params[:description], user_id: session[:user_id])
	if @todo.save
		redirect "/todos"
	end
	erb :"todos/new"
end

# /todos/5
# /todos/18
# /todos/asd
get '/todos/:id' do
	@todo = Todo.find(params[:id])
	erb :"todos/show"
end

get '/todos/:id/edit' do
	@todo = Todo.find(params[:id])
	erb :"todos/edit"
end

put '/todos/:id' do
	@todo = Todo.find(params[:id])
	if @todo.update(title: params[:title], description: params[:description])
		redirect "/todos/#{@todo.id}"
	end
	erb :"todos/edit"
end

delete '/todos/:id' do
	@todo = Todo.find(params[:id])
	if @todo.destroy
		redirect "/todos"
	end
	erb :"todos/show"
end

private

def require_login
	if !session[:user_id]
		redirect "/login"
	end
end