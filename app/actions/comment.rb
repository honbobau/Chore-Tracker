post "/comment/new/:chore_id" do
	text = params[:text]
  chore_id = params[:chore_id]
  user_id = current_user.id
	comment =Comment.new({content: text, chore_id: chore_id, user_id: user_id})
	comment.save
	redirect '/main'
end
