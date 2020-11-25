require 'rails_helper'

RSpec.describe "airlock/index.html.erb", type: :feature do
  it 'Welcomes us aboard' do
    visit airlock_index_path
    expect(page).to have_content('Welcome aboard')
  end

  it 'Allows viewing of posts' do
    visit airlock_index_path
    expect(page).to have_link('View Logs', href: '/posts/')
  end

  it 'Takes user to creation of new post' do
    visit airlock_index_path
    expect(page).to have_link('Generate Log', href: '/posts/new')
  end
end
