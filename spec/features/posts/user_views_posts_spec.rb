require 'rails_helper'
require_relative 'posts_spec_helper'

RSpec.describe "viewing posts", type: :feature do

  scenario "Find out time of creation" do
    Timecop.freeze(Time.new(2020,1,1,12,0))
    user_submits_post("It's time!")
    expect(page).to have_content("1|1|2020")
    expect(page).to have_content("12:00")
  end
end
