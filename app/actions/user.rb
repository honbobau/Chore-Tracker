get "/signup" do
	erb(:signup)
end

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

post "/login" do
	username = params[:user_name]
	password = params[:password]

	user = User.find_by(user_name: username)

	if user && user.password == password
		session[:user_id] = user.id
		redirect to (('/main'))
	else
		@error_message = "Login Error!"
		erb(:index)
	end
end

get '/logout' do
    session[:user_id] = nil
    erb(:index)
end

