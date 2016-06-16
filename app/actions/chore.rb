#brings up the page where admin can add or remove chores
get "/change_list" do
	erb :'/main/change_list'
end

#the action that creates a chore
post "/create_chore" do
	name = params[:name]
	desc = params[:description]
	chore = Chore.new({name: name, description: desc, completed: false, group_id: current_user.group_id})
	chore.save
  redirect "/main"
end

#attaches a user id to a chore
put "/add_id/:id" do
	chore = Chore.find(params[:id])
	chore.update(user_id: current_user.id)
	redirect '/main'
end

#allows a user to complete a task
put '/complete/:id' do
	chore = Chore.find(params[:id])
	chore.update(completed: true)
	redirect '/main'
end

#allows an admin to delete a chore
delete '/removechore' do
	chore = Chore.find(params[:chore_id])
	chore.destroy
	redirect "/main"
end
