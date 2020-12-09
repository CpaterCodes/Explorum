require 'rails_helper'
require_relative 'posts_spec_helper'

RSpec.describe "posts", type: :feature do

  it "allows us to post" do
    expect(page).to have_button("Generate Log")
    user_attempts_post
    expect(page).to have_content("Content to be entered:")
    expect(page).to have_field("log_content")
  end

end
