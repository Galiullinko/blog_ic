module Users
  class CommentsController < ApplicationController
    expose(:post)
    expose(:comment, attributes: :comment_params)
    expose_decorated(:comments) { Comment.by_post(post) }

    def create
      comment.user = current_user
      comment.post = post
      if comment.save
        redirect_to post_path(comment.post)
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
