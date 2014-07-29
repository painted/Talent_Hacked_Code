require 'rails_helper'

describe 'languages' do
  before do
    george = Developer.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
    login_as george, scope: :developer
    Language.create(name: 'English')
    visit developer_path(george.id)
  end
  
  context 'there are no languages' do
    it 'no languages' do
      expect(page).to have_content 'No languages'
    end
  end

  it 'can add a language' do
    click_link 'Edit'
    fill_in 'Languages', with: 'English'
    click_button 'Update'
    expect(page).to have_content 'English'
  end

  it 'can add two languages' do
    click_link 'Edit'
    fill_in 'Languages', with: 'English, Spanish'
    click_button 'Update'
    expect(page).to have_content 'English'
    expect(page).to have_content 'Spanish'
  end

end

describe 'languages already exists' do
  before do
    george = Developer.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
    login_as george, scope: :developer
    Language.create(name: 'English')
    visit developer_path(george.id)
  end

  it 'does not duplicates skills' do
    click_link 'Edit'
    fill_in 'Languages', with: 'English'
    click_button 'Update'
    expect(Language.count).to eq 1
  end
end