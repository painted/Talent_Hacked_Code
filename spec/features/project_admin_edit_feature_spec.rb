require 'rails_helper'

describe 'project:' do

	context 'admin' do

		before do
			client = Client.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			admin = AdminUser.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')		
			@project = client.projects.create(name: "New Project")
			skill_one = Skill.create(name: "Ruby")
			skill_two = Skill.create(name: "Js")
			skill_three = Skill.create(name: "c++")
			@project.skills << skill_one << skill_two
			login_as admin, scope: :admin_user
			visit admin_root_path
		end
	
		it 'can see a project\'s skills list' do
			click_link "Projects"
			click_link @project.id
			expect(page).to have_content("Ruby Js") 
		end

		it 'can edit a project\'s skills list' do
			click_link "Projects"
			click_link @project.id
			click_link "Edit Project"
			fill_in 'Skill list', with: 'c++'
			click_button "Update Project"
			expect(page).to have_content("c++") 
		end
	end
end