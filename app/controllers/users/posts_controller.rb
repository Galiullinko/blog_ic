module Users
  class PostsController < ApplicationController
    before_action :authenticate_user!
    expose_decorated(:post, attributes: :post_params)
    expose_decorated(:comments) { post.comments.includes(:user) }
    expose_decorated(:posts) { recent_posts_finder }
    expose(:comment) { post.comments.new }

    # TODO: respond_with (responder)
    def create
      post.user = current_user
      if post.save
        redirect_to post_path(post)
      else
        render "new"
      end
    end

    def destroy
    end

    def show
    end

    def new
    end

    def update
      post.save
      respond_with post
    end

    def edit
    end

    private

    def recent_posts_finder
      Post.includes(:user).order(created_at: :desc).limit(25)
    end

    def post_params
      params.require(:post).permit(:title, :text, :user)
    end
  end
end
