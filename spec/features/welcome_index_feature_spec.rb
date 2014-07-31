require 'rails_helper'

describe 'welcome page' do
 
    it 'shows the welcome page' do
        visit root_path
        expect(page).to have_content 'Welcome to Talent Hacked'
    end

    context 'while no user is signed in' do

        it '\'Clients\' button is shown' do
            visit root_path
            expect(page).to have_link 'Clients'
        end

       it '\'Developers\' button is shown' do
            visit root_path
            expect(page).to have_link 'Developers'
        end

        it '\'Dashboard\' link is not shown' do
            visit root_path
            expect(page).not_to have_content 'Dashboard'
        end
    end

    context 'while a developer is signed in' do
 
        before do
            developer = Developer.create email: 'f@f.com', password: '12345678', password_confirmation: '12345678'
            login_as developer, scope: :developer
            visit root_path
        end

        it 'shows the \'Dashboard\' link' do
            expect(page).to have_content 'Dashboard'
        end

       it 'shows the \'Sign out\' link' do
            expect(page).to have_link 'Sign out'
        end

      it '\'Clients\' button is not shown' do
            visit root_path
            expect(page).not_to have_link 'Clients'
        end

       it '\'Developers\' button is not shown' do
            visit root_path
            expect(page).not_to have_link 'Developers'
        end


    end

   context 'while a client is signed in' do
 
        before do
            client = Client.create email: 'f@f.com', password: '12345678', password_confirmation: '12345678'
            login_as client, scope: :client
            visit root_path
        end

        it 'shows the \'Dashboard\' link' do
            expect(page).to have_content 'Dashboard'
        end

       it 'shows the \'Sign out\' link' do
            expect(page).to have_link 'Sign out'
        end

        it '\'Clients\' button is not shown' do
            visit root_path
            expect(page).not_to have_link 'Clients'
        end

        it '\'Developers\' button is not shown' do
            visit root_path
            expect(page).not_to have_link 'Developers'
        end

        it 'they can navigate to their dashboard' do
            click_link 'Dashboard'
            expect(current_path).to eq '/dashboard'
            expect(page).to have_content 'Dashboard'
        end
    end
end



