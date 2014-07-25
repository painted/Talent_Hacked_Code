require 'rails_helper'

describe 'skill input in' do

	context 'developer profile form' do

		before do
			john = Developer.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			login_as john
			# visit edit_developer_registration_path
		end
	
		it 'can be added to the developer profile' do
			visit '/dashboard'
			click_link 'Edit profile'
			fill_in 'Skill', with: 'Ruby'
			click_button 'Update'
			expect(page).to have_content 'Ruby'
		end

	end

	# context 'relationship between projects and skills' do
	# end


end	



