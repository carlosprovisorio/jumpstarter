class Project < ActiveRecord::Base
	belongs_to :user
	has_many :rewards
  has_many :pledges, through: :rewards
  validates :name, :goal, :description, :start_date, :end_date, presence: true

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true


  def amount_raised
    self.pledges.sum(:price)
  end
end
