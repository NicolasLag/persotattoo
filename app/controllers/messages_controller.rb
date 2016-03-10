class MessagesController < ApplicationController

  def create

    @proposal = Proposal.find(params[:proposal_id])
    message = @proposal.messages.new(message_params)
    message.user = current_user
    message.save
    redirect_to @proposal
  end

  private

  def message_params
    params[:message].permit(:content, images: [])
  end
end
