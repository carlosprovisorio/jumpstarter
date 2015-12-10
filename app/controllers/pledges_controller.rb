class PledgesController < ApplicationController
before_action :require_login

  def create
    @pledge = Pledge.new(reward_id: @reward.id)
    @pledge.user = current_user

    if @pledge.save
      redirect_to project_path(@project), notice: 'You claimed a pledge!'
    else
      render 'product_path'
    end
  end
end
