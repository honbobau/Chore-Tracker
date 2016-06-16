#creates a group and adds the group id to the current user
post "/group/create" do
	name = params[:group_name]
	@group = Group.new({group_name: name, admin_id: current_user.id})
	@group.save
	current_user.update(group_id: @group.id)
	redirect '/main'
end

#joins a group by the group name
put "/group/join" do
	name = params[:group_name]
	@group = Group.find_by(group_name: name)
 	if @group == nil	
 		@error_message = "Group cannot be found!"
		redirect '/main'
	else
		current_user.update(group_id: @group.id)
	end
	redirect '/main'
end

# Logs user out of group
put "/group/leave" do
	current_user.update(group_id: nil)
	redirect '/main'
end

#removes the group id from the user
delete "/group/remove" do
	group = Group.find(params[:id])
	group.destroy
end 
