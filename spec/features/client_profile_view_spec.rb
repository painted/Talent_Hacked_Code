require 'rails_helper'

describe 'client profile view' do

	context 'client' do

		before do
			peter = Client.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			login_as peter, scope: :client
			visit edit_client_registration_path
			fill_in "Name", with: "Pizza Express"
			fill_in "Email", with: "a@a.com"
			fill_in "Phone", with: "07777 777 777"
			fill_in "Industry", with: "Military"
			fill_in "Address", with: "25 City Road, London"
			fill_in "Website", with: "https://www.google.co.uk"
			fill_in "Facebook", with: "https://www.facebook_url"
			fill_in "Twitter", with: "https://www.twitter_url"
			fill_in "Github", with: "https://www.github_url"
			fill_in "LinkedIn Url", with: "https://www.linkedin_url"
			fill_in "Avatar Url", with: "https://www.avatar_url"
			fill_in "Contact Name", with: "Peter"
			fill_in "Mobile", with: "06666 666 666"
			fill_in "Role", with: "Director"
			fill_in "Date of Birth", with: "01/01/1960"
			fill_in "Company Bio", with: "YoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYo"
			attach_file 'Image', Rails.root.join('spec/images/company_logo.jpg')
			click_button "Update"
		end

		it 'can welcome the client by name' do
			expect(page).to have_content 'Pizza Express'
		end

		it 'can show the client his email' do
			expect(page).to have_content 'a@a.com'
		end

		it 'can show the client his phone number' do
			expect(page).to have_content '07777 777 777'
		end

		it 'can show the client his date of industry' do
			expect(page).to have_content 'Military'
		end

		it 'can show the client his address' do
			expect(page).to have_content '25 City Road, London'
		end

		it 'can show the client his website' do
			expect(page).to have_content 'https://www.google.co.uk'
		end

		it 'can show the client his facebook' do
			expect(page).to have_content 'https://www.facebook_url'
		end

		it 'can show the client his twitter' do
			expect(page).to have_content 'https://www.twitter_url'
		end

		it 'can show the client his github url' do
			expect(page).to have_content 'https://www.github_url'
		end

		it 'can show the client his LinkedIn url' do
			expect(page).to have_content 'https://www.linkedin_url'
		end

		it 'can show the client his avatar url' do
			expect(page).to have_content 'https://www.avatar_url'
		end

		it 'can show the client contact\'s name' do
			expect(page).to have_content 'Peter'
		end

		it 'can show the client contact\'s role' do
			expect(page).to have_content 'Director'
		end

		it 'can show the client contact\'s mobile number' do
			expect(page).to have_content '06666 666 666'
		end

		it 'can show the client contact\'s date of birth' do
			expect(page).to have_content '1960-01-01'
		end

		it 'can show the client company bio' do
			expect(page).to have_content 'YoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYo'
		end
		
		it 'shows the client their chosen avatar or image' do
			expect(page).to have_css 'img.uploaded-pic'
		end		

		it 'has an edit button' do
			expect(page).to have_link 'Edit'
		end

		it 'goes to the edit profile page with edit button click' do 
			click_link "Edit"
			expect(current_path).to include edit_client_registration_path
		end
	end	
end
