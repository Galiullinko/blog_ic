module Users
  class CommentsController < ApplicationController
    expose(:post)
    expose(:comment, attributes: :comment_params)
    expose(:comments, ancestor: :post)

    def create
      comment.user = current_user
      comment.post = post
      if comment.save
        respond_with post
      else
        flash[:error] = "Error"
      end
    end

    def destroy
      comment.destroy
      respond_with post
    end

    private

    def comment_params
      params.require(:comment).permit(:text)
    end
  end
end
