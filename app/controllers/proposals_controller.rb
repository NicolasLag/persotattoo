class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all
  end

  def create
     @proposal = Proposal.new(proposal_params)
    if @proposal.save
      redirect_to new_proposal_path
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
end
