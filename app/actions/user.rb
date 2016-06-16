#calls the signup page
get "/user/new" do
	@user = User.new
	erb(:signup)
end

#Creates a new user and save to database if it is valid
post "/user/new" do
	username = params[:user_name]
	realname = params[:real_name]
	password = params[:password]

	@user = User.new({ user_name: username, real_name: realname, password: password})

	if @user.save
    session[:user_id] = @user.id
		redirect(to('/main'))
	else
		erb(:signup)
	end

end

#logs the user in if their username/password combo found in database
post "/user/login" do
	username = params[:user_name]
	password = params[:password]

	user = User.find_by(user_name: username)

	if user && user.password == password
		session[:user_id] = user.id
		redirect to '/main'
	else
		erb(:index)
	end
end

#gets the user outta here
get '/user/logout' do
    session[:user_id] = nil
    erb(:index)
end

get '/user/:id' do
	@user = User.find params[:id]
	erb :'main/profile'
end



