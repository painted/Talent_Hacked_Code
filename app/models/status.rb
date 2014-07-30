class Status < ActiveRecord::Base
	belongs_to :project
	belongs_to :developer
<<<<<<< HEAD
=======

	attr_accessor :project_id
	attr_accessor :developer_id
	attr_accessor :status


>>>>>>> b2a3c13bb3c38c8dc9b20836f4f446cb02d5104b
end
