require 'rails_helper'

describe 'admin can verify a developer' do

	context 'developer' do


		it 'is not verified when created' do 
			john = Developer.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			login_as john, scope: :developer
			expect(john.verified).to be false
		end

		context 'logged in as developer' do
			before do
				@john = Developer.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
				bob = AdminUser.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')		
				login_as bob, scope: :admin_user
			end
			
			it 'can be verified by admin' do 
				visit admin_root_path
				click_link "Developers"
				click_link @john.id
				click_link "Edit Developer"
				find(:css, "#developer_verified").set(true)
				click_button "Update Developer"
				within '.row-verified' do
					expect(page).to have_content 'true'
				end
				expect(page).to have_css '.flash', text: 'Developer was successfully updated.'
			end

			it 'can be unverified by admin' do 
				visit admin_root_path
				click_link "Developers"
				click_link @john.id
				click_link "Edit Developer"
				find(:css, "#developer_verified").set(true)
				click_button "Update Developer"
				click_link "Edit Developer"
				find(:css, "#developer_verified").set(false)
				click_button "Update Developer"
				within '.row-verified' do
					expect(page).to have_content 'Empty'
				end
				expect(page).to have_css '.flash', text: 'Developer was successfully updated.'
			end
		end
	end
end