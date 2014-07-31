require 'rails_helper'

def confirm_creation
	click_button 'Create Project'
end

describe 'adding a project' do

	let!(:fitsum) { Client.create name: 'Fitsum', email: 'f@f.com', password: '12345678', password_confirmation: '12345678'}
	before do 
		login_as fitsum, scope: :client
		visit dashboard_path(fitsum.id)
		click_link 'New Project'
	end


	it 'can add a project name' do	
		fill_in 'Name', with: 'Build Website'
		confirm_creation
		expect(page).to have_content 'Build Website'
	end	

	it 'can add a project deadline' do
		fill_in 'Deadline', with: '01/01/2066'
		confirm_creation
		expect(page).to have_content '2066-01-01'
	end	

	it 'can add a project budget' do
		fill_in 'Budget (GBP)', with: '5000'
		confirm_creation
		expect(page).to have_content '£5,000.00'
	end	

	it 'can add a project industry' do
		fill_in 'Industry', with: 'Tech'
		confirm_creation
		expect(page).to have_content 'Tech'
	end	

	it 'can add a project description' do 
		fill_in 'Description', with: 'Lorem Ipsum'
		click_button 'Create Project'
		expect(page).to have_content 'Lorem Ipsum'
	end
end