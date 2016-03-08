class HiddenProjectsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @project.hidden_projects.create(user: current_user)
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end
end
