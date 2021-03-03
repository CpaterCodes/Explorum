require 'rails_helper'

RSpec.describe "Delete a comment", type: :feature do

  scenario "Comment will be removed" do
    post = create(:post, content: 'I take comments')
    create(:comment, message: 'I am a comment', post: post, user: create(:user))
    visit comments_path(post)
    click_on "Erase Comment"
    expect(page).not_to have_content("I am a comment")
  end

  scenario "Can only remove own comments" do
    post = create(:post, content: 'I take comments')
    create(:comment, message: 'I am a comment', post: post, user: create(:user))
    troublemaker = create(:user, username: 'Haha', email: 'chaos@example.com')
    sign_on('chaos@example.com', 'p4ssw0rd')
    visit comments_path(post)
    expect(page).not_to have_link("Erase Comment")
  end

end
