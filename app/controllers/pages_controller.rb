class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :sign_up_artist]

  def home
  end

  def me
    render(:layout => "layouts/dashboard")
    @projects = current_user.projects
    @proposals = current_user.proposals
  end

  def sign_up_artist
    @user = User.new
  end
end
