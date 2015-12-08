class User < ActiveRecord::Base
	has_many :projects 
	#has_many :projects, through: :claims # commenting this allows user1.projects << proj1. Otherwise getting an error Active record through association
	has_many :rewards, through: :pledges # re-added
	has_many :pledges
end
