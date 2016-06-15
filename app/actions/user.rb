#calls the signup page
get "/signup" do
	erb(:signup)
end

#Creates a new user and save to database if it is valid
post "/signup" do
	username = params[:user_name]
	realname = params[:real_name]
	password = params[:password]

	@user = User.new({ user_name: username, real_name: realname, password: password})

	if @user.save
		redirect(to('/'))
	else
		erb(:signup)
	end

end

#logs the user in if their username/password combo found in database
post "/login" do
	username = params[:user_name]
	password = params[:password]

	user = User.find_by(user_name: username)

	if user && user.password == password
		session[:user_id] = user.id
		redirect to '/main'
	else
		@error_message = "Login Error!"
		erb(:index)
	end
end

#gets the user outta here
get '/logout' do
    session[:user_id] = nil
    erb(:index)
end

