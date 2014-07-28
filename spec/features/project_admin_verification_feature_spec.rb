require 'rails_helper'

describe 'admin can verify:' do

	context 'project' do

		
		it 'is not verified when created' do 
			paul = Client.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			login_as paul, scope: :client
			paul.projects.create(name: "New Project")
			expect(paul.projects.first.verified).to be false
		end

		context 'logged in as an admin' do
			before do
				paul = Client.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
				bob = AdminUser.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')		
				login_as bob, scope: :admin_user
				@coolproject = paul.projects.create(name: "New Project")
			end
			
			it 'can be verified by admin' do 
				visit admin_root_path
				click_link "Projects"
				click_link @coolproject.id
				click_link "Edit Project"
				# save_and_open_page
				find(:css, "#project_verified").set(true)
				click_button "Update Project"
				within '.row-verified' do
					expect(page).to have_content 'true'
				end
				expect(page).to have_css '.flash', text: 'Project was successfully updated.'
			end

			it 'can be unverified by admin' do 
				visit admin_root_path
				click_link "Projects"
				click_link @coolproject.id
				click_link "Edit Project"
				find(:css, "#project_verified").set(true)
				click_button "Update Project"
				click_link "Edit Project"
				find(:css, "#project_verified").set(false)
				click_button "Update Project"
				within '.row-verified' do
					expect(page).to have_content 'Empty'
				end
				expect(page).to have_css '.flash', text: 'Project was successfully updated.'
			end
		end
	end
end