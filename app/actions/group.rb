require "pry"

#creates a group and adds the group id to the current user
post "/create" do
	name = params[:group_name]
	@group = Group.new({group_name: name})
	@group.save
	current_user.update(group_id: @group.id, is_admin: true)
	redirect "/main"
end

#joins a group by the group name
put "/join" do
	name = params[:group_name]
	@group = Group.find_by(group_name: name)
	current_user.update(group_id: @group.id)
	redirect "/main"
end

# Logs user out of group
put "/leave" do
	current_user.update(group_id: nil)
	redirect "/main"
end

#removes the group id from the user
delete "/remove" do
	group = Group.find(params[:id])
	group.destroy
end 
