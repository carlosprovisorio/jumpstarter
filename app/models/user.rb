class User < ActiveRecord::Base

	has_many :projects 
	#has_many :projects, through: :claims # commenting this allows user1.projects << proj1. Otherwise getting an error Active record through association
	has_many :rewards, through: :pledges # re-added
	has_many :pledges
	has_many :backed_projects, through: :rewards, source: :project, class_name: "Project"


	authenticates_with_sorcery!

	validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
	validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
	validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

	validates :email, uniqueness: true

	accepts_nested_attributes_for :pledges, reject_if: :all_blank, allow_destroy: true

	def pledged_amount(project)
		amount = 0
		self.pledges.each do |pledge|
			amount += pledge.reward.price if pledge.reward.project == project  
		end
		return amount
	end

end
