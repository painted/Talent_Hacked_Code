require 'rails_helper'

describe 'developer profile view' do

	context 'developer' do

		before do
			john = Developer.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678', )
			login_as john
			visit edit_developer_registration_path
			fill_in "Name", with: "John"
			fill_in "Email", with: "a@a.com"
			fill_in "Phone", with: "07777 777 777"
			fill_in "Date of Birth", with: "01/01/1980"
			fill_in "Address", with: "25 City Road, London"
			fill_in "Website", with: "https://www.google.co.uk"
			fill_in "Facebook", with: "https://www.facebook_url"
			fill_in "Twitter", with: "https://www.twitter_url"
			fill_in "Github", with: "https://www.github_url"
			fill_in "LinkedIn Url", with: "https://www.linkedin_url"
			fill_in "Avatar Url", with: "https://www.avatar_url"
			click_button "Update"
		end

		it 'can welcome the developer by name' do
			expect(page).to have_content 'Profile for John'
		end

		it 'can show the developer his email' do
			expect(page).to have_content 'a@a.com'
		end

		it 'can show the developer his phone number' do
			expect(page).to have_content '07777 777 777'
		end

		it 'can show the developer his date of birth' do
			expect(page).to have_content '1980-01-01'
		end

		it 'can show the developer his address' do
			expect(page).to have_content '25 City Road, London'
		end

		it 'can show the developer his website' do
			expect(page).to have_content 'https://www.google.co.uk'
		end

		it 'can show the developer his facebook' do
			expect(page).to have_content 'https://www.facebook_url'
		end

		it 'can show the developer his twitter' do
			expect(page).to have_content 'https://www.twitter_url'
		end

		it 'can show the developer his github url' do
			expect(page).to have_content 'https://www.github_url'
		end

		it 'can show the developer his LinkedIn url' do
			expect(page).to have_content 'https://www.linkedin_url'
		end

		it 'can show the developer his avatar url' do
			expect(page).to have_content 'https://www.avatar_url'
		end

		it 'has an edit button' do
			expect(page).to have_link 'Edit'
		end

		it 'goes to the edit profile page with edit button click' do 
			click_link "Edit"
			expect(current_path).to include edit_developer_registration_path
		end
	end	
end