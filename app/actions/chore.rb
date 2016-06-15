post "/create_chore" do
	name = params[:name]
	desc = params[:description]
	chore = Chore.new({name: name, description: desc, completed: false, group_id: current_user.group_id})
	chore.save
end

get '/:id' do
	@chore = Chore.find params[:id]
end

put '/complete' do
	chore = Chore.find(params[:chore_id])
	chore.update(completed: true)
end

delete '/removechore' do
	chore = Chore.find(params[:chore_id])
	chore.destroy
end
