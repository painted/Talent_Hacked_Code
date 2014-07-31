require 'rails_helper'

describe 'dashboard' do
  # context 'clients' do
  #   let!(:client) {Client.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')}
  #   before do
  #     login_as client, scope: :client
  #     visit dashboard_path
  #   end
  #   it 'can go to the new project creation form' do
  #     click_link 'New Project'
  #     expect(current_path).to eq new_client_project_path(client)
  #   end

  #   it 'a newly created project should have a pending status' do
  #     click_link 'New Project'
  #     fill_in 'Name', with: 'Talent Hacked Website'
  #     click_button 'Create Project'
  #     expect(current_path).to eq dashboard_path
  #     expect(page).to have_content '1 Pending'
  #   end

  #   it 'can change a status of a project to in progress' do
  #     click_link 'New Project'
  #     fill_in 'Name', with: 'Talent Hacked Website'
  #     click_button 'Create Project'
  #     # client.projects.last.status = 'In Progress'
  #     expect(page).to have_content '1 In Progress'
  #     expect(page).to have_content '0 Pending'
  #   end
  # end
end