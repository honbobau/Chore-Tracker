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

  #helper to check whether or not an admin exists
  def group_admin_check
    Group.find_by(id: current_user.group_id)
  end

  #helper to find user in a group who has done the most chores
  def most_chores_completed
    if current_user.group.chores.where(completed: true).max_by(&:user_id)
      current_user.group.chores.where(completed: true).max_by(&:user_id).user
    end 
  end

  def recently_completed_chore
    if current_user.group.chores.where(completed: true).max_by(&:completed_at)
      current_user.group.chores.where(completed: true).max_by(&:completed_at)
    end
  end

end

#redirects to the main app page and passes a list of chores related to the group id
get '/main' do  
  chore_list = Chore.where(group_id: current_user.group_id)
  # binding.pry
  @chores = chore_list.select {|chore| chore[:completed] == false}
  @chores_completed = chore_list.select {|chore| chore[:completed] == true && chore[:show?] == true}
	erb :'/main/index'
end

#redirects to the index
get '/' do
  erb :index
end
