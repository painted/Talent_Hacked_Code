require 'rails_helper'

describe 'admin can verify:' do

	context 'client' do
	
		it 'is not verified when created' do 
			paul = Client.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			login_as paul, scope: :client
			expect(paul.verified).to be false
		end

		context 'logged in as client' do
			before do
				@paul = Client.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
				bob = AdminUser.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')		
				login_as bob, scope: :admin_user
			end
			
			it 'can be verified by admin' do 
				visit admin_root_path
				click_link "Clients"
				click_link @paul.id
				click_link "Edit Client"
				# save_and_open_page
				find(:css, "#client_verified").set(true)
				click_button "Update Client"
				within '.row-verified' do
					expect(page).to have_content 'true'
				end
				expect(page).to have_css '.flash', text: 'Client was successfully updated.'
			end

			it 'can be unverified by admin' do 
				visit admin_root_path
				click_link "Clients"
				click_link @paul.id
				click_link "Edit Client"
				find(:css, "#client_verified").set(true)
				click_button "Update Client"
				click_link "Edit Client"
				find(:css, "#client_verified").set(false)
				click_button "Update Client"
				within '.row-verified' do
					expect(page).to have_content 'Empty'
				end
				expect(page).to have_css '.flash', text: 'Client was successfully updated.'
			end
		end
	end
end