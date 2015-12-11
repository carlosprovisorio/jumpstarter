class PledgesController < ApplicationController
before_action :require_login


def new
	@pledge = Pledge.new(reward_id: params[:reward_id])
    @current_user.pledges << @pledge

    if @pledge.save
		redirect_to user_path(current_user)    
	else
      	render 'project_path'	
    end
 
end

  def create


  end

end
