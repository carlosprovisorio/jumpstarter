class User < ActiveRecord::Base

	has_many :projects 
	#has_many :projects, through: :claims # commenting this allows user1.projects << proj1. Otherwise getting an error Active record through association
	has_many :rewards, through: :pledges # re-added
	has_many :pledges


	authenticates_with_sorcery!

	validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
	validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
	validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

	validates :email, uniqueness: true

	accepts_nested_attributes_for :pledges, reject_if: :all_blank, allow_destroy: true
end
