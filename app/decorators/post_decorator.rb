class PostDecorator < ApplicationDecorator
  delegate :title, :text, :user, :comments

  def author
    user.full_name
  end

  def comments_number
    comments.count
  end

  def text_html
    text.html_safe
  end
end
