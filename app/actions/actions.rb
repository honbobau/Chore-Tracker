# Homepage (Root path)
helpers do

  #helper to detect the current user_id session
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  #helper to detect if the current user currently is logged into a group
  def current_group_id
  	current_user.group_id
  end

  def group_admin_check
    Group.find_by(id: current_user.group_id)
  end

end

#redirects to the main app page and passes a list of chores related to the group id
get '/main' do  
  @chores = Chore.where(group_id: current_user.group_id)
	erb :'/main/index'
end

#redirects to the index
get '/' do
  erb :index
end
