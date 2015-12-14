 class Pledge < ActiveRecord::Base
	belongs_to :reward
	belongs_to :user #added by avi
  	delegate :price, to: :rewards
end
