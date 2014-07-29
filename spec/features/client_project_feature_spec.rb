require 'rails_helper'

describe 'client project profile view' do

	context 'client' do

		before do
			george = Client.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			login_as george, scope: :client
			visit client_projects_path(george.id)
		end

		it 'has a link to add a new project' do 
			expect(page).to have_link "Add Project"
		end

		it 'goes to the add project page with add project button click' do 
			click_link "Add Project"
			expect(current_path).to eq new_client_project_path(Client.first.id)
		end
	end
end