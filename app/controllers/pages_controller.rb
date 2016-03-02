class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def me
    @projects = current_user.projects
    @proposals = current_user.proposals
  end
end
