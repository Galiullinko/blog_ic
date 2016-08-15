class PostDecorator < ApplicationDecorator
  deligate :title, :text, :user
end
