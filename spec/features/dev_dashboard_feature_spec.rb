require 'rails_helper'

describe 'developer dashboard' do

 	context 'when first looking at the dashboard' do

		before do
			@john = Developer.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			login_as @john, scope: :developer
			visit dashboard_path
		end

		
		it 'has zero pending quotation projects' do
			expect(page).to have_content '0 Pending Quotation'
		end

		it 'has zero pending Approval projects' do
			expect(page).to have_content '0 Pending Approval'
		end

		it 'has zero confirmed projects' do
			expect(page).to have_content '0 Confirmed'
		end

		it 'has zero completed projects' do
			expect(page).to have_content '0 Completed'
		end

		it 'has zero declined projects' do
			expect(page).to have_content '0 Declined'
		end
	end

	context 'changing project status' do
		 before do
		 	@client = Client.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			@project = @client.projects.create(name: "New Project")
			@john = Developer.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
			Status.create(:project_id => @project.id, :developer_id => @john.id)
			login_as @john, scope: :developer
		 end

		it 'has one pending quotation project' do
			visit dashboard_path
			expect(page).to have_content '1 Pending Quotation'
		end

		it 'has one pending approval project' do
			@status = Status.find_by(:project_id => @project.id, :developer_id => @john.id)
			@status.status = "pitched"
			@status.save
			visit dashboard_path
			expect(page).to have_content '1 Pending Approval'
		end

		it 'has one completed project' do
			@status = Status.find_by(:project_id => @project.id, :developer_id => @john.id)
			@status.status = "completed"
			@status.save
			visit dashboard_path
			expect(page).to have_content '1 Completed'
		end

		it 'has one declined project' do
			@status = Status.find_by(:project_id => @project.id, :developer_id => @john.id)
			@status.status = "declined"
			@status.save
			visit dashboard_path
			expect(page).to have_content '1 Declined'
		end
		
	end

end
