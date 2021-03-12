require 'rails_helper'
require_relative 'users_spec_helper'

RSpec.describe "Sign in as a returning user", type: :feature do

  scenario "Can sign back in" do
    full_sign_up('ExampleUser', 'user@example.com', 'p4ssw0rd')
    sign_off
    sign_on('user@example.com', 'p4ssw0rd')
    expect(page).to have_content('Using as: ExampleUser')
  end
end
