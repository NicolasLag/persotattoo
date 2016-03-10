class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :sign_up_artist]
  layout "dashboard", only: [:me, :me_winnings, :me_artist, :me_artist_winnings]

  def home
  end

  def me
    @projects = current_user.projects.proposable
  end

  def me_artist
    @projects = Project.not_blacklisted(current_user)
  end

  def sign_up_artist
    @user = User.new
  end

  def me_artist_winnings
    @proposals = current_user.proposals.validated
    @proposals_not_validated = current_user.proposals - current_user.proposals.validated
  end

  def me_winnings
    @projects = current_user.projects
    render(:layout => "layouts/dashboard")
  end
end
