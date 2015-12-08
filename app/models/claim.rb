class Claim < ActiveRecord::Base
	belongs_to :reward
	belongs_to :user #added by avi
end
