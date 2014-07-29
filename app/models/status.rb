class Status < ActiveRecord::Base
	belongs_to :project
	belongs_to :developer

	attr_accessor :project_id
	attr_accessor :developer_id
	attr_accessor :status


end
