class ProjectsController < ApplicationController
before_action :require_login

	def new
		@project = Project.new
	end


	def create
		@project = Project.new(project_params)
		@project.user = current_user

		if @project.save
      		redirect_to project_path(@project), notice: "Successfully created the product."
    	else
      		render :new
    	end
	end

	def show
		 @project = Project.find(params[:id])
	end


  	def index
  		@projects = Project.all
  	end


	def edit
		@project = Project.find(params[:id])
	end


	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(project_params)
			redirect_to project_path(@project)
		else 
			render :edit
		end 
	end


	def destroy
	end

private

  def project_params
    params.require(:project).permit(:name, :start_date, :end_date, :goal, :description, :active, rewards_attributes: [:id, :price, :title, :_destroy, :description])
  end

end


#@project = @temp_user.projects.build(project_params)
#@temp_user.projects <<  @project
#@project = @temp_user.build_project(project_params)

