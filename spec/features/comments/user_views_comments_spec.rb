require 'rails_helper'
require_relative 'comments_spec_helper'

RSpec.describe "View comments under a post", type: :feature do

  before(:each) do
    Timecop.freeze(Time.new(2020,1,1,12,0))
    @post = create(:post, content: 'I take comments')
    Timecop.freeze(Time.new(2021,1,1,14,50))
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

  scenario "Comment will have timestamp" do
    visit post_comments_path(@post)
    expect(page).to have_content("1|1|2021")
    expect(page).to have_content("14:50")
  end

  scenario "Comment will have a username" do
    visit post_comments_path(@post)
    expect(page).to have_content("Entered by: BotUser")
  end

end
