require "rails_helper"

feature "Delete post", js: true do
  include_context "current user signed in"

  let(:post) { create :post, user: current_user }

  scenario "User deletes post" do
    visit post_path(post)

    click_on "Delete"
    expect(page).to have_content("Post was successfully destroyed")
  end
end
