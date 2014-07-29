require 'rails_helper'

describe 'Skills for projects' do
  before do
      george = Client.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
      login_as george, scope: :client
      george.projects.create(name: 'website')
      visit client_path(george.id)
  end
  context 'when there are no skills' do
    it 'says that there are no skills yet' do
      expect(page).to have_content 'No skills yet'
    end
  end

  it 'can add a skill to a project' do
    click_link 'Add Project'
    fill_in 'Skills', with: 'Ruby'
    click_button 'Create Project'
    expect(page).to have_content 'Ruby'
  end
end