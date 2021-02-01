require 'rails_helper'
require_relative 'posts_spec_helper'

RSpec.describe "creating posts", type: :feature do

  scenario "Attempt to post" do
    user_attempts_post
    expect(page).to have_content("Content to be entered:")
    expect(page).to have_field("post_content")
  end

  scenario "post appears on the timeline" do
    message = "Hello World and welcome to the explorum"
    user_submits_post(message)
    expect(page).to have_content(message)
  end

  scenario "anonymous posts above 50 characters are not accepted" do
    long_post = "a" * 51
    user_submits_post(long_post)
    expect(page).not_to have_content(long_post)
  end

end
