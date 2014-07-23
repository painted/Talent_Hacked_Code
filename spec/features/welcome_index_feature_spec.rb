require 'rails_helper'

describe 'welcome page' do
  it 'shows the welcome page' do
    visit '/'
    expect(page).to have_content 'Welcome to Talent Hacked'
  end
end