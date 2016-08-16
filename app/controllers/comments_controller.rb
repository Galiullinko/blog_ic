class CommentsController < ApplicationController
  expose(:comment, attributes: :comment_params, from: :post)

  def create
    comment.user = current_user
    binding.pry
    if comment.save
      redirect_to post_path(comment.post)
    else
      flash[:error] = "Error"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
