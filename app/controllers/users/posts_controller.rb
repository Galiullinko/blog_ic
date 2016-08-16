module User
  class PostsController < ApplicationController
    before_action :authenticate_user!
    expose_decorated(:post, attributes: :post_params)

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

    private

    def post_params
      params.require(:post).permit(:title, :text, :user)
    end

  end
end
