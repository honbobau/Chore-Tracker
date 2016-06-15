post "/create" do
	name = params[:group_name]

	@group = Group.new({group_name: name})
	@group.save
	redirect to ('/main')
end

put "/join" do
	name = params[:group_name]
	group = Group.where(group_name: name)
	current_user.group_id = group.id
	current_user.save
	redirect to ('/main')
end

delete "/remove" do
	group = Group.find(params[:id])
	group.destroy
end