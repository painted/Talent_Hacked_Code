require 'rails_helper'

describe 'client profile form' do

	context 'client' do

		before do
			john = Client.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			login_as john, scope: :client
			visit edit_client_registration_path
		end

		it 'can visit the edit profile page' do
			expect(page).to have_content 'Client Profile'
		end

		it 'can fill-in/change their name' do
			fill_in "Name", with: "John"
			click_button "Update"
			visit edit_client_registration_path
			expect(find_field("Name").value).to eq 'John'
		end

		it 'can change their email' do
			fill_in "Email", with: "a@a.com"
			click_button "Update"
			visit edit_client_registration_path
			expect(find_field("Email").value).to eq 'a@a.com'
		end

		it 'can fill-in/change their phone number' do
			fill_in "Phone", with: "999"
			click_button "Update"
			visit edit_client_registration_path
			expect(find_field("Phone").value).to eq '999'
		end

		it 'can fill-in/change their date of birth' do
			fill_in "Industry", with: "Electronics"
			click_button "Update"
			visit edit_client_registration_path
			expect(find_field("Industry").value).to eq 'Electronics'
		end	

		it 'can fill-in/change their address' do
			fill_in "Address", with: "1 City Street"
			click_button "Update"
			visit edit_client_registration_path
			expect(find_field("Address").value).to eq '1 City Street'
		end	

		it 'can fill-in/change their website url' do
			fill_in "Website", with: "https://www.google.co.uk"
			click_button "Update"
			visit edit_client_registration_path
			expect(find_field("Website").value).to eq "https://www.google.co.uk"
		end

		it 'can fill-in/change their facebook url' do
			fill_in "Facebook", with: "https://www.facebook_url"
			click_button "Update"
			visit edit_client_registration_path
			expect(find_field("Facebook").value).to eq 'https://www.facebook_url'
		end

		it 'can fill-in/change their twitter url' do
			fill_in "Twitter", with: "https://www.twitter_url"
			click_button "Update"
			visit edit_client_registration_path
			expect(find_field("Twitter").value).to eq 'https://www.twitter_url'
		end

		it 'can fill-in/change their Github url' do
			fill_in "Twitter", with: "https://www.github_url"
			click_button "Update"
			visit edit_client_registration_path
			expect(find_field("Twitter").value).to eq 'https://www.github_url'
		end

		it 'can fill-in/change their LinkedIn url' do
			fill_in "LinkedIn Url", with: "https://www.linkedin_url"
			click_button "Update"
			visit edit_client_registration_path
			expect(find_field("LinkedIn Url").value).to eq 'https://www.linkedin_url'
		end

		it 'can fill-in/change their Avatar image url' do
			fill_in "Avatar Url", with: "https://www.avatar_url"
			click_button "Update"
			visit edit_client_registration_path
			expect(find_field("Avatar Url").value).to eq 'https://www.avatar_url'
		end

		it 'can change their password' do
			fill_in "Password", with: "12121212"
			fill_in "Password confirmation", with: "12121212"
			click_button "Update"
			visit root_path
			click_link "Sign out"
			click_link "Client Sign in"
			fill_in 'Email', with: 'f@f.com'
			fill_in 'Password', with: '12121212'
			click_button 'Sign in'
			expect(page).to have_content 'Signed in successfully'
		end
	end	
end