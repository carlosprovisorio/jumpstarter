class PledgesController < ApplicationController
before_action :require_login


def new
	@pledge = Pledge.new(reward_id: params[:reward_id])
    @current_user.pledges << @pledge

    if @pledge.save
      #redirect_to project_path(@current_user), notice: 'You claimed a pledge!'
      redirect_to :back
      #link_to("Project", :back) 
    else
      render 'product_path'
    end
 
end

  def create


  end
end
