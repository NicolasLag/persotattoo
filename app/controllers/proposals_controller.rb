class ProposalsController < ApplicationController

  before_action :set_proposal, only: [:show, :edit, :update, :destroy]
  layout "dashboard", only: [:show, :index]

  def index
    @proposals = Project.find(params[:project_id]).proposals
    @message = Message.new
  end


  def show
    @message = Message.new()
  end

  def new
    @project = Project.find(params[:project_id])
    @proposal = Proposal.new
  end

  def create
     @proposal = current_user.proposals.new(proposal_params)
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

