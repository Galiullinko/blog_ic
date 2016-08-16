class PostsController < ApplicationController
  expose_decorated(:post, attributes: :post_params)
  expose_decorated(:posts)
  expose_decorated(:comments) { post.comments.includes(:user) }
  expose_decorated(:comment) { post.comments.new }
  expose_decorated(:users)

  def index
    posts = Post.includes(:user).order(created_at: :desc)
    posts = posts.where(user: params[:user]) if params[:user]
  end

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
