class ProposalsController < ApplicationController

  before_action :set_proposal, only [ :show, :edit, :update, :destroy]

  def index
    @proposals = Proposal.all
  end


  def show
  end

  def new
    @proposal = Proposal.new
  end

  def create
     @proposal = current_user.new(proposal_params)
     # @proposal = current_user.proposal.new(proposal_params)
    if @proposal.save

      redirect_to root_path
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
