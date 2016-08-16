class PostDecorator < ApplicationDecorator
  delegate :title, :text, :user, :comments

  def author
    user.full_name
  end
end
