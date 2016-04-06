class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comments = Comment.order('created_at DESC')
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'Your comment was posted. Thank you!'
    else
      flash[:error] = 'Your comment cannot be post'
    end
    redirect_to root_url
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
