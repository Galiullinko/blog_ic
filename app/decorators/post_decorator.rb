class PostDecorator < ApplicationDecorator
  delegate :title, :text, :user
end
