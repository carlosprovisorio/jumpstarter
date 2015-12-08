class Project < ActiveRecord::Base
	belongs_to :user
	has_many :rewards
	has_many :claims, through: :rewards
end
