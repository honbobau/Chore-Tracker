# Homepage (Root path)
helpers do
	def current_user
    User.find_by(id: session[:user_id])
  end

  def current_group
  	current_user.group_id
  end
end

get '/' do
  erb :index
end
