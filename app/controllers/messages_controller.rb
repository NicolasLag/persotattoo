class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversations_path
  end

  def send_message(recipients, msg_body, subject, sanitize_text=true, attachment=nil, message_timestamp = Time.now)
    convo = Mailboxer::ConversationBuilder.new({
      :subject    => subject,
      :created_at => message_timestamp,
      :updated_at => message_timestamp
    }).build

    message = Mailboxer::MessageBuilder.new({
      :sender       => self,
      :conversation => convo,
      :recipients   => recipients,
      :body         => msg_body,
      :subject      => subject,
      :attachment   => attachment,
      :created_at   => message_timestamp,
      :updated_at   => message_timestamp
    }).build

    message.deliver false, sanitize_text
  end
end
