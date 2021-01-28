require 'rails_helper'
require_relative 'posts_spec_helper'
require_relative '../users/users_spec_helper'

RSpec.describe "deleting posts", type: :feature do

  scenario "User deletes own post" do
    full_sign_up('MistakesWereMade', 'clumsy@example.com', 'p4ssw0rd')
    user_submits_post('aWHOOPS')
    click_link('Erase Log')
    expect(page).not_to have_content('aWHOOPS')
  end

  scenario "User cannot delete other posts" do
    full_sign_up('DontTryIt', 'cautious@example.com', 'w0rdp4ss')
    user_submits_post('Nice try')
    expect(page).to have_link('Erase Log')
    sign_off
    full_sign_up('IWillAnyways', 'sneaky@example.com', 'p4ssw0rd')
    visit posts_path
    expect(page).not_to have_link('Erase Log')
  end

end
