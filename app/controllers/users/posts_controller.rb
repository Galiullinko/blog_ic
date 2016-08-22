module Users
  class PostsController < ApplicationController
    before_action :authenticate_user!
    expose_decorated(:post, attributes: :post_params)
    expose_decorated(:comments) { post.comments.includes(:user) }
    expose(:comment) { post.comments.new }
    expose(:user) {  }

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

    private

    def post_params
      params.require(:post).permit(:title, :text, :user)
    end
  end
end
