post "/create" do
	name = params[:group_name]

	@group = Group.new({group_name: name})

	@group.save
	redirect to ('/main')

end

post "/join" do
	name = params[:group_name]
end

delete "/remove" do
	group = Group.find(params[:id])
	group.destroy
end