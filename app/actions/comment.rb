post "/comment/new/:id" do
	text = params[:text]
  chore_id = params[:id]
	comment =Comment.new({content: text, chore_id: chore_id})
	comment.save
	redirect '/main'
end
