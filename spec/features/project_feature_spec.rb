# require 'rails_helper'

# describe 'project' do
	
# 	def fill_form(name, email,phone,website)
# 	    fill_in 'Name', with: name
# 	    fill_in 'Email', with: email
# 	    fill_in 'Phone', with: phone
# 	    fill_in 'Website', with: website
#   	end

# 	it 'has no projects at first' do
# 		visit '/clients'
# 		click_link 'Add clients'
# 		fill_form('Fitsum', 'f@f.com', '044044044', 'www.f.com')
# 		click_button 'Create Client'
# 		click_link 'Fitsum'
# 		click_link 'Add'
# 		fill_form('Faezrah', 'f@f.com', '044044044', 'www.f.com')
# 		click_button 'Create Contact'
# 		expect(page).to have_content 'Projects'
# 		expect(page).to have_content 'No Project'
# 	end
# end

# describe 'adding a project' do

# 	let!(:fitsum) { Client.create name: 'Fitsum', email: 'f@f.com', phone:  '044044044', website: 'www.f.com', industry: 'tech'}
# 	before do
# 		fitsum.contacts.create name: 'Faezrah', email: 'f@f.com', phone:  '044044044', website: 'www.f.com'
# 	end


# 	it 'can add a project contact' do
# 		visit '/clients'
# 		# fitsum.contacts.create name: 'Faezrah', email: 'f@f.com', phone:  '044044044', website: 'www.f.com'
# 		click_link 'Fitsum'
# 		click_link 'Add Project'
# 		# save_and_open_page
# 		fill_in 'Name', with: 'Build Website'
# 		fill_in 'Deadline', with: '01/08/2014'
# 		expect(page).to have_content 'Build Website'
# 		expect(page).to have_content '01/08/2014'
# 	end	
# end




# # require 'rails_helper'

# # describe 'project contact' do
# #     # before do
# #     #    fitsum = Client.create name: 'Fitsum', email: 'f@f.com', phone:  '044044044', website: 'www.f.com', industry: 'tech'
# #     # end

# #     let!(:fitsum) { Client.create name: 'Fitsum', email: 'f@f.com', phone:  '044044044', website: 'www.f.com', industry: 'tech'}

# #    def fill_form(name, email,phone,website)
# #     fill_in 'Name', with: name
# #     fill_in 'Email', with: email
# #     fill_in 'Phone', with: phone
# #     fill_in 'Website', with: website
# #   end

# # 	it 'there are no project contacts' do
# # 		visit '/clients'
# # 		click_link 'Fitsum'
# # 		expect(page).to have_content 'Project Manager'
# # 		expect(page).to have_content 'No Project Managers'
# # 	end

# 	# it 'can add a project contact' do
# 	# 	Contact.create name: 'Faezrah', email: 'f@f.com', phone:  '044044044', website: 'www.f.com'
# 	# 	visit '/clients'
# 	# 	click_link 'Fitsum'
# 	# 	click_link 'Project Manager'
# 	# 	expect(page).to have_content 'Project Manager'
# 	# 	expect(page).to have_content 'Faezrah'
# 	# end

# 	# it 'can add more than one project contact' do
# 	# 	Contact.create name: 'Faezrah', email: 'f@f.com', phone:  '044044044', website: 'www.f.com'
# 	# 	Contact.create name: 'Kate', email: 'f@f.com', phone:  '044044044', website: 'www.f.com'		
# 	# 	visit '/clients'
# 	# 	click_link 'Fitsum'
# 	# 	click_link 'Project Manager'
# 	# 	expect(page).to have_content 'Project Manager'
# 	# 	expect(page).to have_content 'Faezrah'
# 	# 	expect(page).to have_content 'Kate'
# 	# end

# # 	it 'can add a project manager' do
# # 		visit '/clients'
# # 		click_link 'Fitsum'
# # 		click_link 'Add'
# #       		fill_form('Faezrah', 'f@f.com', '044044044', 'www.f.com')
# #       		click_button 'Create Contact'
# # 		expect(page).to have_content 'Project Manager'
# # 		expect(page).to have_content 'Faezrah'
# # 	end

# # 	context 'manipulating project manager data' do
# # 		before do
# # 			fitsum.contacts.create name: 'Faezrah', email: 'f@f.com', phone:  '044044044', website: 'www.f.com'
# # 		end					

# # 		it 'can edit a project manager info' do
# # 			visit '/clients'
# # 			click_link 'Fitsum'
# # 			# save_and_open_page
# # 			click_link 'Edit PM'
# # 	      		fill_form('Faezrah', 'f@f.com', '044044044', 'www.f.com')
# # 	      		click_button 'Update Contact'
# # 			expect(page).to have_content 'Project Manager'
# # 			expect(page).to have_content 'Faezrah'		
# # 		end
# # 	end
# # end