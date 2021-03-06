class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new
  before_action :find_project, only: [:show]

  def index
  end

  def new
    @project = Project.new
    if session[:project]
      @project = Project.new(session[:project])
    end
  end

  def create
    @project = current_user.projects.new(project_params)
    order = Order.create!(amount: @project.price, state: 'pending')
    if @project.save
      redirect_to new_order_payment_path(order)
    else
      render :create
    end
  end

  def show
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params[:project].permit(:title, :description, :style, :height, :width, :price, photos: [])
  end
end
