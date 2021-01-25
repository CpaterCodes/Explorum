require 'rails_helper'
require_relative 'users_spec_helper'

RSpec.describe "Sign out of session as user", type: :feature do

  scenario "Indicates log off" do
    full_sign_up('ExampleUser', 'user@example.com', 'p4ssw0rd')
    sign_off
    expect(page).not_to have_content('Using as: ExampleUser')
  end
end
