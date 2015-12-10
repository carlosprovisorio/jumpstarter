class Project < ActiveRecord::Base
	belongs_to :user
	has_many :rewards
	has_many :pledges, through: :rewards 
	validates :name, :goal, :description, :start_date, :end_date, presence: true
end
