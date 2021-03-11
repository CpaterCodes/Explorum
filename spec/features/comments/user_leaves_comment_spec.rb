require 'rails_helper'
require_relative 'comments_spec_helper'

RSpec.describe "Leave a comment", type: :feature do

  before(:each) do
    @post = create(:post, content: 'I take comments')
    create(:user)
  end

  scenario "Link available to comment on post" do
    sign_on('bot@example.com', 'p4ssw0rd')
    visit post_comments_path(@post)
    expect(page).to have_link('Generate Comment', href: new_post_comment_path(@post))
  end

  scenario "Can leave comment on post" do
    sign_on('bot@example.com', 'p4ssw0rd')
    user_comments_on_post(@post, 'I am a comment')
    expect(page).to have_content('I am a comment')
  end

  scenario "Must be signed in to leave comments" do
    visit post_comments_path(@post)
    expect(page).not_to have_link('Generate Comment')
  end
end
