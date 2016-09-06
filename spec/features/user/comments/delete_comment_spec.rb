require "rails_helper"

feature "Delete comment" do
  include_context "current user signed in"

  let(:post) { create :post }
  let(:comment) { create :comment, user: current_user, post: post }

  scenario "User deletes own comment" do
    post.comments = [comment] # TODO: FactoryGirl indexes
    visit post_path(post)

    click_on "Delete"
    expect(page).not_to have_content(comment.text)
  end
end
