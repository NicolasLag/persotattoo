class ProposalsController < ApplicationController

  before_action :set_proposal, only: [:show, :edit, :update, :destroy]

  def index
    @proposals = Project.find(params[:project_id]).proposals
  end


  def show
    @project = current_user.proposals.first
  end

  def new
    @project = Project.find(params[:project_id])
    @proposal = Proposal.new
  end

  def create
     # @proposal = Proposal.new(proposal_params)
     @proposal = current_user.proposals.new(proposal_params)
     @proposal.project = Project.find(params[:project_id])
    if @proposal.save

      redirect_to me_artist_path
    else
      # Rails.logger.info(@race.errors.full_messages)
      render :new
    end
  end


  def edit
  end


  def update
  end

  def destroy
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end

  def proposal_params
    params.require(:proposal).permit(:project_id, :content, :user_id, photos: [])
  end
end
