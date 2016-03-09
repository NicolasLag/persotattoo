class MessagesController < ApplicationController

  def create

    @proposal = Proposal.find(params[:proposal_id])
    message = @proposal.messages.new(user: current_user, content: message_params[:content])
    message.save
    redirect_to @proposal
  end

  private

  def message_params
    params[:message].permit(:content)
  end
end
