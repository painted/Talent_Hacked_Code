require 'rails_helper'

describe 'welcome page' do
  it 'shows the welcome page' do
    visit '/'
    expect(page).to have_content 'Welcome to Talent Hacked'
  end

  context 'whilst logged out' do
    it 'no dashboard link is shown' do
      visit '/'
      expect(page).to have_content 'Welcome to Talent Hacked'
      expect(page).not_to have_content 'Dashboard'
    end
  end

  context 'whilst logged in' do
    before do
      developer = Developer.create email: 'f@f.com', password: '12345678', password_confirmation: '12345678'
      login_as developer
    end

    it 'shows the dashboard link' do
      visit '/'
      expect(page).to have_content 'Dashboard'
    end

    it 'clicks the dashboard button' do
      visit '/'
      click_link 'Dashboard'
      expect(current_path).to eq('/dashboard')
      expect(page).to have_content 'Dashboard'
    end
  end
end