require 'rails_helper'

describe 'a developer project quotation form' do

	before do
		john = Developer.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
		# george = Client.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
		login_as john, scope: :developer
		# login_as george, scope: :client
		# visit  new_client_project_quote_path
		visit '/developer/new/quote'
	end

  it 'there is a field to input a quote' do
		fill_in "Quote:", with: "20 pounds per hour"
		click_button "Submit"
		visit new_client_project_path(Client.first.id)
		expect(find_field("Quote").value).to eq "20 pounds per hour"
	end

  	it 'there is a field to input a time estimate' do
		fill_in "Time:", with: "35 Hours"
		click_button "Submit"
		visit new_client_project_path(Client.first.id)
		expect(find_field("Time").value).to eq "Time"
	end

    it 'there is a field to explain wokflow' do
		fill_in "Explanation of workflow:", with: "Explanation"
		click_button "Submit"
		visit new_client_project_path(Client.first.id)
		expect(find_field("Explanation of workflow:").value).to eq "Explanation"
	end
	

    it 'there is a field to write a short pitch' do
		fill_in "Pitch (why you):", with: "Motivational words"
		click_button "Submit"
		visit new_client_project_path(Client.first.id)
		expect(find_field("Pitch (why you)").value).to eq "Motivational words"
	end
end