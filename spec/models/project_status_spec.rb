require 'rails_helper'

describe 'project status' do

	before do
		@client = Client.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
		@project = @client.projects.create(name: "New Project")	
		@status = @project.statuses.find_by(project_id: @project.id)
	end

	it "when first created is set to \'pending\'" do 
		expect(@status[:status]).to eq "pending"
	end

	it "can be changed to \'in progress\'" do 
		@status.update_column(:status, "in progress")
		expect(@status[:status]).to eq "in progress"
	end

	it "can be changed to \'completed\'" do 
		@status.update_column(:status, "completed")
		expect(@status[:status]).to eq "completed"
	end

	it "can be changed to \'rejected\'" do 
		@status.update_column(:status, "rejected")
		expect(@status[:status]).to eq "rejected"
	end
end

