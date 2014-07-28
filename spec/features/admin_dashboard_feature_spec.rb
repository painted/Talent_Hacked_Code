require 'rails_helper'

describe 'admin dashboard page' do

	context "admin dashboard" do

		it "requires admin sign in before access" do
			visit admin_root_path
			expect(page).to have_content "You need to sign in or sign up before continuing."
		end
	end

	context 'admin' do

		before do
			admin = AdminUser.create(email: 'admin@email.com', password: '12345678', password_confirmation: '12345678')
			login_as admin, scope: :admin_user
			visit admin_root_path
		end

		it "can sign in" do
			expect(page).to have_content "Dashboard"
			expect(page).to have_link "Logout"
		end

		it "can sign out" do
			click_link "Logout"
			expect(page).to have_content "Welcome to Talent Hacked"
			expect(page).not_to have_content "Dashboard"
		end
	end
end
