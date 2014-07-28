require 'rails_helper'

describe 'skills' do

  before do
      george = Developer.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
      login_as george, scope: :developer
      visit developer_path(george.id)
  end
  context 'there are no skills' do
    it 'no skills' do
      expect(page).to have_content 'No skills'
    end

    it 'can add a skill' do
      click_link 'Edit'
      fill_in 'Skills', with: 'Ruby'
      click_button 'Update'
      expect(page).to have_content 'Ruby'
    end

    it 'can add two skills' do
      click_link 'Edit'
      fill_in 'Skills', with: 'Ruby, Python'
      click_button 'Update'
      expect(page).to have_content 'Ruby'
      expect(page).to have_content 'Python'
    end
  end
end

describe 'skills already exists' do
  before do
    george = Developer.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
    login_as george, scope: :developer
    Skill.create(name: 'Ruby')
    visit developer_path(george.id)
  end

  it 'does not duplicates skills' do
    click_link 'Edit'
    fill_in 'Skills', with: 'Ruby'
    click_button 'Update'
    expect(Skill.count).to eq 1
  end
end