class CommentsController < ApplicationController
  expose(:comment, attributes: :comment_params)
  expose(:post)

  def create
    comment.user = current_user
    comment.post = post
    if comment.save
      redirect_to post_path(comment.post)
    else
      flash[:error] = "Error"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
