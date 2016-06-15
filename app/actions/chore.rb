get "/change_list" do
	erb :'/main/change_list'
end

post "/create_chore" do
	name = params[:name]
	desc = params[:description]
	chore = Chore.new({name: name, description: desc, completed: false, group_id: current_user.group_id})
	chore.save
  redirect "/main"
end

put '/complete' do
	chore = Chore.find(params[:chore_id])
	chore.update(completed: true)
	redirect '/main'
end

delete '/removechore' do
	chore = Chore.find(params[:chore_id])
	chore.destroy
	redirect "/main"
end
