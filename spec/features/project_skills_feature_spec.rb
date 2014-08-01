require 'rails_helper'

describe 'Skills for projects' do
  let!(:george) { Client.create email: 'f@f.com', password: '12345678', password_confirmation: '12345678'}
  let!(:project1) { george.projects.create name: 'Build Website' }
  before do
      login_as george, scope: :client
      george.projects.create(name: 'website')
      visit client_projects_path(george.id)
  end
  context 'when there are no skills' do
    it 'says that there are no skills yet' do
      visit client_project_path(george.id, project1.id)
      expect(page).to have_content 'No skills'
    end
  end

  it 'can add a skill to a project' do
    click_link 'Add Project'
    fill_in 'Skills', with: 'Ruby'
    click_button 'Create Project'
    # visit client_projects_path(george.id)    
    expect(page).to have_content 'Ruby'
  end

  it 'can not add the same skill to a project twice' do 
    click_link 'Add Project'
    fill_in 'Skills', with: 'Ruby,Ruby'
    click_button 'Create Project'
    # visit client_project_path(george.id, project1.id)    
    expect(page).to have_content 'Ruby'
    expect(Project.last.skills.count).to eq 1
  end
end