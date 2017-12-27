class PostscommentsController < ApplicationController
	before_action :authenticate_user! 

def create
params[:postscomment][:post_id] = params[:post_id]
params[:postscomment][:user_id] = current_user.id
pp @postscomment = Postscomment.create(postscomments_params)
if @postscomment.save
else
@postscomment.errors.full_messages.each do |msg|
@msg = msg
end
flash[:notice] = "#{@msg}"
end
redirect_to post_path(params[:post_id])
end

private
def postscomments_params
params.require(:postscomment).permit(:user_id, :post_id, :text)

end

end
