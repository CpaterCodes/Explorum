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

  scenario "posts by registered users have a higher limit of 300" do
    verbose_post = "a" * 200
    absurd_post = "b" * 301
    create(:user, email: 'v@example.com', password: 'p4ssw0rd')
    sign_on('v@example.com', 'p4ssw0rd')
    user_submits_post(verbose_post)
    expect(page).to have_content(verbose_post)

    user_submits_post(absurd_post)
    expect(page).not_to have_content(absurd_post)
  end

end
