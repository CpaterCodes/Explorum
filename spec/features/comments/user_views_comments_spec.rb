require 'rails_helper'
require_relative 'comments_spec_helper'

RSpec.describe "View comments under a post", type: :feature do

  before(:each) do
    @post = create(:post, content: 'I take comments')
    create(:comment, message: 'I am a comment', post: @post, user: create(:user))
  end

  scenario "Option to view comments" do
    visit posts_path
    expect(page).to have_link('View Comments', href: post_comments_path(@post))
  end

  scenario "Comment will show" do
    visit post_comments_path(@post)
    expect(page).to have_content('I am a comment')
  end

end
