class RewardController < ApplicationController
before_action :require_login

def show
  @reward = Reward.find(params[:id])
end

end
