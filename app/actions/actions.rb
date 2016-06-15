# Homepage (Root path)
helpers do
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def current_group
  	current_user.group_id
  end
end

get '/main' do
  @chores = Chore.where('group_id = current_user.group_id")
	erb :'/main/index'
end

get '/' do
  erb :index
end
