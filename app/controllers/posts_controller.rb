class PostsController < ApplicationController
  expose_decorated(:posts) { recent_posts_finder }
  expose_decorated(:comments) { post.comments.includes(:user) }
  expose_decorated(:comment) { post.comments.new }

  def index
  end

  def show
  end

  private

  def recent_posts_finder
    Post.includes(:user).order(created_at: :desc).limit(25)
  end

  def post_params
    params.require(:post).permit(:title, :text, :user)
  end
end
