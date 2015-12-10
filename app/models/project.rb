class Project < ActiveRecord::Base
	belongs_to :user
	has_many :rewards
	has_many :pledges, through: :rewards

  def amount_raised
    self.rewards.sum(:price)

  end



end
