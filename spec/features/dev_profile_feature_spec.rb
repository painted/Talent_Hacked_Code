require 'rails_helper'
require 'spec_helper'

describe 'developer profile form' do

	context 'developer' do

		before do
			john = Developer.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			login_as john
			visit edit_developer_registration_path
		end

		it 'can visit the profile page' do
			expect(page).to have_content 'Edit Developer'
		end

		it 'can visit the profile page' do
			fill_in "Name", with: "John"
			fill_in "Current password", with: "12345678"
			click_button "Update"
			visit edit_developer_registration_path
			expect(find_field("Name").value).to eq 'John'
		end

		it 'can visit the profile page and fill out all details' do
			fill_in "Phone", with: "999"
			fill_in "Current password", with: "12345678"
			click_button "Update"
			visit edit_developer_registration_path
			expect(find_field("Phone").value).to eq '999'
		end

		it 'can visit the profile page and fill out all details' do
			fill_in "Dob", with: "1980-01-01"
			fill_in "Current password", with: "12345678"
			click_button "Update"
			visit edit_developer_registration_path
			expect(find_field("Dob").value).to eq '1980-01-01'
		end	

		it 'can visit the profile page and fill out all details' do
			fill_in "Address", with: "1 City Street"
			fill_in "Current password", with: "12345678"
			click_button "Update"
			visit edit_developer_registration_path
			expect(find_field("Address").value).to eq '1 City Street'
		end	

		it 'can visit the profile page and fill out all details' do
			fill_in "Website", with: "https://www.google.co.uk"
			fill_in "Current password", with: "12345678"
			click_button "Update"
			visit edit_developer_registration_path
			expect(find_field("Website").value).to eq "https://www.google.co.uk"
		end

		it 'can visit the profile page and fill out all details' do
			fill_in "Facebook", with: "https://www.facebook_url"
			fill_in "Current password", with: "12345678"
			click_button "Update"
			visit edit_developer_registration_path
			expect(find_field("Facebook").value).to eq 'https://www.facebook_url'
		end

		it 'can visit the profile page and fill out all details' do
			fill_in "Twitter", with: "https://www.twitter_url"
			fill_in "Current password", with: "12345678"
			click_button "Update"
			visit edit_developer_registration_path
			expect(find_field("Twitter").value).to eq 'https://www.twitter_url'
		end

		it 'can visit the profile page and fill out all details' do
			fill_in "LinkedIn URL", with: "https://www.linkedin_url"
			fill_in "Current password", with: "12345678"
			click_button "Update"
			visit edit_developer_registration_path
			expect(find_field("LinkedIn URL").value).to eq 'https://www.linkedin_url'
		end

		it 'can visit the profile page and fill out all details' do
			fill_in "Facebook", with: "https://www.facebook_url"
			fill_in "Current password", with: "12345678"
			click_button "Update"
			visit edit_developer_registration_path
			expect(find_field("Facebook").value).to eq 'https://www.facebook_url'
		end


		it 'can visit the profile page and fill out all details' do
			fill_in "Avatar URL", with: "https://www.avatar_url"
			fill_in "Current password", with: "12345678"
			click_button "Update"
			visit edit_developer_registration_path
			expect(find_field("Avatar URL").value).to eq 'https://www.avatar_url'
		end


	end	
end