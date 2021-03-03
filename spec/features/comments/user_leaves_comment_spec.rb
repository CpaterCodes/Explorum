require 'rails_helper'

RSpec.describe "Leave a comment", type: :feature do

  scenario "Link available to comment on post" do
    post = create(:post, content: 'I take comments')
    visit post_comments_path(post)
    expect(page).to have_link('Generate Comment', href: new_post_comment_path(post))
  end

  scenario "Can leave comment on post" do
    post = create(:post, content: 'I take comments')
    visit new_post_comment_path(post)
    fill_in "comment_message", with: "I am a comment"
    click_on "Enter Comment"
    expect(page).to have_content('I am a comment')
  end

end
