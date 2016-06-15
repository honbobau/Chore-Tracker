post "/create" do
	name = params[:group_name]
	@group = Group.new({group_name: name})
	@group.save
	current_user.update(group_id: @group.id)
	redirect to ('/main')
end

put "/join" do
	name = params[:group_name]
	@group = Group.find_by(group_name: name)
	current_user.update(group_id: @group.id)
	redirect to ('/main')
end

delete "/remove" do
	group = Group.find(params[:id])
	group.destroy
end