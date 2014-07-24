require 'rails_helper'

describe 'client' do 

	let(:client) {Client.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')}
	it 'initially has no projects' do 
		expect(client.projects.count).to eq 0
	end

	it 'can have a project' do 
		client.projects.create(name: "myproject", deadline: "01/01/2014")
		expect(client.projects.count).to eq 1
		expect(client.projects.first.name).to eq "myproject"
		# expect(client.projects.first.deadline).to include(2014)
	end

	it 'can have multiple projects' do 
		client.projects.create(name: "myproject", deadline: "01/01/2014")
		client.projects.create(name: "projecttwo", deadline: "01/01/2015")
		expect(client.projects.count).to eq 2
		expect(client.projects.first.name).to eq "myproject"
		expect(client.projects.second.name).to eq "projecttwo"
		# expect(client.projects.first.deadline).to include(2014)
	end

end