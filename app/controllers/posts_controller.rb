class PostsController < ApplicationController
  expose_decorated(:post, attributes: :post_params)
  expose_decorated(:comments) { post.comments }
  expose_decorated(:comment) { post.comments.new }

  def create
    post.user = current_user
    if post.save
      redirect_to post_path(post)
    else
      render "new"
    end
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :user)
  end
end
