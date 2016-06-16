#brings up the page where admin can add or remove chores
get "/chore/change" do
	@chore = Chore.new
	erb :'/main/change_list'
end

#the action that creates a chore
post "/chore/create" do
	name = params[:name]
	desc = params[:description]
	@chore = Chore.new({name: name, description: desc, completed: false, group_id: current_user.group_id})
	if @chore.save
  	redirect "/main"
	else
		erb :'/main/change_list'
	end
end

#attaches a user id to a chore
put "/chore/add/:id" do
	chore = Chore.find(params[:id])
	chore.update(user_id: current_user.id)
	redirect '/main'
end

#allows a user to complete a task
put '/chore/complete/:id' do
	chore = Chore.find(params[:id])
	chore.update(completed: true)
	redirect '/main'
end

#allows an admin to delete a chore
delete '/chore/removechore/:id' do
	chore = Chore.find(params[:chore_id])
	chore.destroy
	redirect "/main"
end
