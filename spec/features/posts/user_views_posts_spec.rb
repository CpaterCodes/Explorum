require 'rails_helper'
require_relative 'posts_spec_helper'
require_relative '../users/users_spec_helper'

RSpec.describe "viewing posts", type: :feature do

  scenario "Find out time of creation" do
    Timecop.freeze(Time.new(2020,1,1,12,0))
    create(:post, content: "It's time!")
    visit posts_path
    expect(page).to have_content("1|1|2020")
    expect(page).to have_content("12:00")
  end

  scenario "Find out user" do
    create(:post, content: "Hi!", user: create(:user, username: 'UserFriend'))
    visit posts_path
    expect(page).to have_content("Entered by: UserFriend")
  end

  scenario "Anonymous posts display 'n/a'" do
    create(:post, content: 'No one will ever know!!')
    visit posts_path
    expect(page).to have_content("Entered by: n/a")
  end
end
