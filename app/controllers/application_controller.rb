class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, unless: :devise_controller?

  def authenticate_user!(*arg)
    session[:project] = Project.new(project_params) if params[:project]
    redirect_to new_user_registration_path unless user_signed_in?
  end

  def project_params
    params[:project].permit(:title, :description, :style, :height, :width, :price)
  end

  def after_sign_in_path_for(resource)
    if resource.artist
      flash[:notice] = "hello artist"
      me_artist_path
    else # client
      flash[:notice] = "hello user"
      register_project || me_path
    end
  end

  def after_sign_up_path_for(resource)
    if resource.artist
      flash[:notice] = "hello artist"
      me_path
    else # client
      flash[:notice] = "hello user"
      register_project || me_path
    end
  end

  def register_project
    return nil unless session[:project]
    @project = Project.new(session[:project])
    @project.user = current_user
    if @project.save
      me_path
    else
      new_project_path
    end
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end
end
