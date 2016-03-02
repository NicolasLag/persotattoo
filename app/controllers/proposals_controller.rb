class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all
  end

  def create
     @proposal = current_user.proposal.new(proposal_params)
    if @proposal.save
      redirect_to root_path
    else
      # Rails.logger.info(@race.errors.full_messages)
      render :new
    end
  end

  def new
    @proposal = Proposal.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

def proposal_params
  params.require(:proposal).permit(:project_id, :content, :user_id, photos: [])
end
end
