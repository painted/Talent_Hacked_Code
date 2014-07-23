require 'rails_helper'

describe 'client registration and login' do

	context 'client' do 

		it 'can sign up' do
			visit new_client_registration_path
			fill_in 'Email', with: 'f@f.com'
			fill_in 'Password', with: '12345678'
			fill_in 'Password confirmation', with: '12345678'
			click_button 'Sign up'
			expect(page).to have_content 'Welcome! You have signed up successfully.'
		end
	end

	context 'registered client' do

		before do
			Client.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			visit new_client_session_path
		end

		it 'can sign in' do
			fill_in 'Email', with: 'f@f.com'
			fill_in 'Password', with: '12345678'
			click_button 'Sign in'
			expect(page).to have_content 'Signed in successfully'
		end

		it 'can log out' do 
			fill_in 'Email', with: 'f@f.com'
			fill_in 'Password', with: '12345678'
			click_button 'Sign in'
			expect(page).to have_content 'Signed in successfully'
			click_link 'Sign out'
			expect(page).to have_content 'Signed out successfully.'
		end
	end
end
