class ProposalsController < ApplicationController

  before_action :set_proposal, only: [:show, :edit, :update, :destroy]

  def index
    @proposals = Project.find(params[:project_id]).proposals
    @message = Message.new
  end


  def show
    @proposal = Proposal.find(params[:id])
    @message = @proposal.messages.new()
  end

  def new
    @project = Project.find(params[:project_id])
    @proposal = Proposal.new
  end

  def create
     @proposal = current_user.proposals.new(proposal_params)
     Message.new(@proposal)
     @proposal.project = Project.find(params[:project_id])
    if @proposal.save

      redirect_to me_artist_path
    else
      render :new
    end
  end

  def update
    @proposal = Proposal.find(params[:id])
    @proposal.update(validated_at: DateTime.now)
    message = Message.new(user: current_user, proposal: @proposal, content: params[:proposal][:message][:content])
    message.save
    redirect_to me_path

    # @proposal.update(validated_at: DateTime.now)
    # Message.new(user: current_user, proposal: @proposal, content: )
    # respond_to do |format|
    #   format.html { } # TODO
    #   format.js
    # end
  end

  def destroy
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end

  def proposal_params
    params.require(:proposal).permit(:project_id, :content, :message, :validated_at, :user_id, photos: [])
  end
end

