require 'rails_helper'
require_relative 'posts_spec_helper'
require_relative '../users/users_spec_helper'

RSpec.describe "viewing posts", type: :feature do

  scenario "Find out time of creation" do
    Timecop.freeze(Time.new(2020,1,1,12,0))
    user_submits_post("It's time!")
    expect(page).to have_content("1|1|2020")
    expect(page).to have_content("12:00")
  end

  scenario "Find out user" do
    full_sign_up('UserFriend', 'User@example.com', 'w0rdp4ss')
    user_submits_post("Here I am!")
    expect(page).to have_content("Entered by: UserFriend")
  end

  scenario "Anonymous posts display 'n/a'" do
    user_submits_post("No one will ever know!")
    expect(page).to have_content("Entered by: n/a")
  end
end
