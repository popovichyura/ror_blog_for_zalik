class PostscommentsController < ApplicationController
def create
params[:postscomment][:post_id] = params[:article_id]
params[:postscomment][:user_id] = current_user.id
@postscomment = Postscomment.create(postscomments_params)
if @postscomment.save
redirect_to posts_path(params[:posts_id])
else
@postscomment.errors.full_messages.each do |msg|
@msg = msg
end
flash[:notice] = "#{@msg}"
redirect_to posts_path(params[:posts_id])
end
end

private
def postscomments_params
params.require(:postscomment).permit(:user_id, :posts_id, :textofcom)

end

end
