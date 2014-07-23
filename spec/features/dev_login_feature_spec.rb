require 'rails_helper'

describe 'developer registration and login' do

	context 'developer' do 

		it 'can sign up' do
			visit root_path
			click_link 'Developers'
			fill_in 'Email', with: 'f@f.com'
			fill_in 'Password', with: '12345678'
			fill_in 'Password confirmation', with: '12345678'
			click_button 'Sign up'
			expect(page).to have_content 'Welcome! You have signed up successfully.'
		end

		it 'can sign in with LinkedIn omniauth' do
			visit root_path
			expect(page).to have_link 'Developer Sign in with LinkedIn'
		end
	end

	context 'registered developer' do

		it 'can sign in' do
			Developer.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			visit root_path
			click_link 'Developer Sign in'
			fill_in 'Email', with: 'f@f.com'
			fill_in 'Password', with: '12345678'
			click_button 'Sign in'
			expect(page).to have_content 'Signed in successfully'
		end

		it 'can log out' do 
			Developer.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			visit root_path
			click_link 'Developer Sign in'
			fill_in 'Email', with: 'f@f.com'
			fill_in 'Password', with: '12345678'
			click_button 'Sign in'
			click_link 'Sign out'
			expect(page).to have_content 'Signed out successfully.'
		end
	end


end
