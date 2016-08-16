class CommentDecorator < ApplicationDecorator
  delegate :text, :post, :user
end
