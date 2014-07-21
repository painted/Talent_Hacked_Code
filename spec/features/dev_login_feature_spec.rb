require 'rails_helper'

describe 'developer registration and login' do

	context 'developer' do 

		it 'can sign up' do
			visit '/developers/sign_up'
			fill_in 'Email', with: 'f@f.com'
			fill_in 'Password', with: '12345678'
			fill_in 'Password confirmation', with: '12345678'
			click_button 'Sign up'

			expect(page).to have_content 'Welcome! You have signed up successfully.'
		end

		it 'can sign up with LinkedIn omniauth' do
			visit '/developers/sign_up'
			expect(page).to have_link 'Sign in with Linkedin'
		end
	end

	context 'registered developer' do

		it 'can sign in' do
			Developer.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			visit '/developers/sign_in'
			fill_in 'Email', with: 'f@f.com'
			fill_in 'Password', with: '12345678'
			click_button 'Sign in'

			expect(page).to have_content 'Signed in successfully'
		end

		it 'can log out' do 
			Developer.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			visit '/developers/sign_in'
			fill_in 'Email', with: 'f@f.com'
			fill_in 'Password', with: '12345678'
			click_button 'Sign in'
			click_link 'Sign out'
			expect(page).to have_content 'Signed out successfully.'
		end
	end


end
