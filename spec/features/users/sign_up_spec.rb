require 'rails_helper'
require_relative 'users_spec_helper'

RSpec.describe "Sign up to be a user", type: :feature do
  
  scenario "User can sign up" do
    full_sign_up('ExampleUser', 'user@example.com', 'p4ssw0rd')
    expect(page).to have_content('Using as: ExampleUser')
  end
end
