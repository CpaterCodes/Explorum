require 'rails_helper'
require_relative 'posts_spec_helper'

RSpec.describe "creating posts", type: :feature do

  scenario "Attempt to post" do
    user_attempts_post
    expect(page).to have_content("Content to be entered:")
    expect(page).to have_field("content")
  end

  scenario "post appears on the timeline" do
    message = "Hello World and welcome to the explorum"
    user_attempts_post
    user_submits_post(message)
    expect(page).to have_content(message)
  end

end
