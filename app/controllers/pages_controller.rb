class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :sign_up_artist]

  def home
  end

  def me
    @projects = Project.unvalidated(current_user)
    render(:layout => "layouts/dashboard")
  end

  def me_artist
    @projects = Project.not_blacklisted(current_user)
  end

  def sign_up_artist
    @user = User.new
  end

  def me_artist_winnings
    @proposals = current_user.proposals.validated
  end

  def me_winnings
    @projects = current_user.projects
  end
end
