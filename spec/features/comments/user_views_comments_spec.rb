require 'rails_helper'

RSpec.describe "View comments under a post", type: :feature do

  scenario "Option to view comments" do
    post = create(:post, content: 'I take comments')
    visit posts_path
    expect(page).to have_link('View Comments', href: post_comments_path(post))
  end

  scenario "Comment will show" do
    post = create(:post, content: 'I take comments')
    create(:comment, message: 'I am a comment', post: post, user: create(:user))
    visit post_comments_path(post)
    expect(page).to have_content('I am a comment')
  end

end
