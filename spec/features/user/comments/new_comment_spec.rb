require "rails_helper"

feature "New comment" do
  include_context "current user signed in"

  let(:post) { create :post }

  scenario "User create a new comment" do
    visit post_path(post)

    fill_in "comment_text", with: "123"
    click_button "Create Comment"
    expect(page).to have_content("123")
  end
end
