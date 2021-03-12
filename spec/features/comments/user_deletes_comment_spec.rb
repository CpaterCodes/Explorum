require 'rails_helper'
require_relative 'comments_spec_helper'

RSpec.describe "Delete a comment", type: :feature do

  before(:each) do
    @user = create(:user, username: 'Poster', email: 'poster@example.com')
    @chaos = create(:user, username: 'Haha', email: 'chaos@example.com')
    @post = create(:post, content: 'I take comments')
    create(:comment, message: 'I am a comment', post: @post, user: @user)
  end

  scenario "Comment will be removed" do
    sign_on('poster@example.com', 'p4ssw0rd')
    visit post_comments_path(@post)
    click_on 'Erase Comment'
    expect(page).not_to have_content("I am a comment")
  end

  scenario "Can only remove own comments" do
    sign_on('chaos@example.com', 'p4ssw0rd')
    visit post_comments_path(@post)
    expect(page).not_to have_link("Erase Comment")
  end

end
