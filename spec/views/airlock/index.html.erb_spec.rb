require 'rails_helper'

RSpec.describe "airlock/index.html.erb", type: :feature do
  it 'Welcomes us aboard' do
    visit airlock_index_path
    expect(page).to have_content('Welcome aboard')
  end
end
