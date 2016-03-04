class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new
  before_action :find_project, only: [:show]

  def index
  end

  def new
    @project = Project.new
    if session[:project]
      @project = Project.new(session[:project])
      @project.valid?
    end
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to me_path
    else
      render :create
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params[:project].permit(:title, :description, :style, :height, :width, :price)
  end
end