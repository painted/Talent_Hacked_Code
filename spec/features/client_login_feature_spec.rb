# require 'rails_helper'

describe 'client registration and login' do

	context 'client' do 

		it 'can sign up' do
			visit '/clients/sign_up'
			fill_in 'Email', with: 'f@f.com'
			fill_in 'Password', with: '12345678'
			fill_in 'Password confirmation', with: '12345678'
			click_button 'Sign up'
			expect(page).to have_content 'Welcome! You have signed up successfully.'
		end
	


 		# it 'can sign in with LinkedIn omniauth' do
		# visit '/clients/sign_up'
 		# 	expect(page).to have_link 'Sign in with LinkedIn'
		# end
	end
	context 'registered client' do

		it 'can sign in' do
			Client.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			visit '/clients/sign_in'
			fill_in 'Email', with: 'f@f.com'
			fill_in 'Password', with: '12345678'
			click_button 'Sign in'
			expect(page).to have_content 'Signed in successfully'
		end

		it 'can log out' do 
			Client.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			visit '/clients/sign_in'
			fill_in 'Email', with: 'f@f.com'
			fill_in 'Password', with: '12345678'
			click_button 'Sign in'
			click_link 'Sign out'
			expect(page).to have_content 'Signed out successfully.'
		end

	end
end

