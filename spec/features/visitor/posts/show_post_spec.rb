require "rails_helper"

feature "Show post" do
  let(:post) { create :post }

  scenario "Visitor open a post" do
    visit post_path(post)

    expect(page).to have_content(post.title)
    expect(page).to have_content(post.text)
    expect(page).not_to have_content("Edit")
    expect(page).not_to have_content("Delete")
  end
end
