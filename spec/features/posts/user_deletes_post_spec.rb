require 'rails_helper'
require_relative 'posts_spec_helper'
require_relative '../users/users_spec_helper'

RSpec.describe "deleting posts", type: :feature do

  scenario "User deletes own post" do
    create(:post, content: 'aWHOOPS', user: create(:user))
    visit posts_path
    expect(page).to have_content('aWHOOPS')
    sign_on('bot@example.com', 'p4ssw0rd')
    click_link('Erase Log')
    expect(page).not_to have_content('aWHOOPS')
  end

  scenario "User cannot delete other posts" do
    create(:post, content: "Don't try it!", user: create(:user))
    current_user = create(:user, username: 'IWillAnyways', email: 'mischief@example.com')
    sign_on('mischief@example.com', 'p4ssw0rd')
    expect(page).to have_content("Don't try it!")
    expect(page).not_to have_link('Erase Log')
  end

end
