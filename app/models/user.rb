class User < ActiveRecord::Base
	has_many :projects 
	has_many :projects, through: :claims
	has_many :rewards, through: :claims
end
